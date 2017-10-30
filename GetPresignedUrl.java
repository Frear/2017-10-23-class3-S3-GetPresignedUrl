/*
 * This is for homework for aws class 3
 *
 * This is based off the code sample at
 *   http://docs.aws.amazon.com/AmazonS3/latest/dev/ShareObjectPreSignedURLJavaSDK.html
 */

import com.amazonaws.HttpMethod;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import java.io.IOException;
import java.net.URL;

public class GetPresignedUrl {
  private static String bucketName = "jfrear";
  private static String objectKey = "calfile";
  
  public static void main(String[] args) throws IOException {
    // Generate an s3 client session, assuming a local aws config named "theconfig" and
    // a "default" profile section
    AmazonS3 s3client =
      new AmazonS3Client(new ProfileCredentialsProvider("theconfig","default"));
    
    /* This code sets the link expiration time to a time relative to now
     * // Prepare expiration date object
     * java.util.Date expiration = new java.util.Date();
     * long msec = expiration.getTime();
     * //msec += 1000 * 60 * 60; // 1 hour
     * msec += 1000 * 20; // 20 seconds from now
     * expiration.setTime(msec);
     */

    // Hard code the expiration date to the start of class 5, Tue Nov  7 18:00:00 PST 2017
    java.util.Date expiration = new java.util.Date( 1510106400000L );

    System.out.println("Expiration time is " + expiration.getTime() + "aka " + expiration );
    
    GeneratePresignedUrlRequest generatePresignedUrlRequest =
      new GeneratePresignedUrlRequest(bucketName, objectKey, HttpMethod.GET);
    
    //generatePresignedUrlRequest.setMethod(HttpMethod.GET); // Default.
    generatePresignedUrlRequest.setExpiration(expiration);
    
    URL s = s3client.generatePresignedUrl(generatePresignedUrlRequest);
    
    System.out.println(s);
    
    return;
  }
}
