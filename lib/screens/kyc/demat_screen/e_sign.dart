// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
//
// class ESign extends StatefulWidget {
//    ESign( {Key? key,required this.response}) : super(key: key);
//   var response;
//   @override
//   State<ESign> createState() => _ESignState();
// }
//
// class _ESignState extends State<ESign> {
//
//
//   final html = """<html>
//
// <head>
// 	<link rel="preconnect" href="https://fonts.googleapis.com">
// 	<link rel="preconnect" href="https://fonts.gstatic.com">
// 	<link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
// </head>
//
// <body>
// 	<div>
// 		<section className="subscribe-letter-area animation-div" style="  height: 100%;
//         width: 100%;
//         background-color: #fff;">
// 			<div className="line-shape d-none d-lg-inline-block" style=" position: absolute;
//             right: 0%;
//             left: inherit !important;
//             right: 0;">
// 				<img className="img-fluid" height="450px" style="bottom: 0%;"
//                     src="https://trust-api.trustmony.com/api/v1/image_download?name=Intersection_4.svg" alt="" />
//             </div>
// 				<div className="container custom-container-subs">
// 					<div className="text-center" style="text-align: center !important;">
// 						<div className="animation-pop">
// 							<img className="img-fluid" style="width: 330px; height: 330px;"
//                             src="https://trust-api.trustmony.com/api/v1/image_download?name=preloader.gif" alt="" />
//                     </div>
// 							<div>
// 								<h3 style="font-family: 'Quicksand', sans-serif; font-size: 30px;">Let's E-Sign With
// 									Your
// 									Aadhaar.</h3>
// 							</div>
// 							<form id="URL" name="URL" method="POST"
// 								action="https://pregw.esign.egov-nsdl.com/nsdl-esp/authenticate/esign-doc/"
// 								enctype="multipart/form-data">
// 								<button
//                             style="box-shadow: 0px 3px 6px #00000029;border: 2px solid #22263D;;overflow: hidden;color: #23263B;background: #fff;font-size: 15px;font-family: 'Quicksand', sans-serif;font-weight: 500;line-height: 1;padding: 10px 40px 5px 40px;display: inline-block;border-radius: 0;position: relative;z-index: 1;cursor: pointer;transition: all 0.4s ease-in-out;width: 50%;">Let's
//                             Continue</button>
// 								<input type="hidden" name="msg" value='&lt;?xml version=&#34;1.0&#34; encoding=&#34;UTF-8&#34; standalone=&#34;no&#34;?&gt;&lt;Esign AuthMode=&#34;1&#34; aspId=&#34;ASPTFCSPLUAT006231&#34; ekycId=&#34;&#34; ekycIdType=&#34;A&#34; responseSigType=&#34;pkcs7&#34; responseUrl=&#34;https://trust-api.trustmony.com/api/v1/esign_pdf_callback?params=44_mobile&#34; sc=&#34;Y&#34; ts=&#34;2022-12-30T23:13:51&#34; txn=&#34;UKC:eSign:5280:20221230231345319&#34; ver=&#34;2.1&#34;&gt;&lt;Docs&gt;&lt;InputHash docInfo=&#34;Documents for eSign&#34; hashAlgorithm=&#34;SHA256&#34; id=&#34;1&#34;&gt;7c0b7fbb0472289507af2fddd6b908a414d491dcb24d789f58bce25695d64cae&lt;/InputHash&gt;&lt;/Docs&gt;&lt;Signature xmlns=&#34;http://www.w3.org/2000/09/xmldsig#&#34;&gt;&lt;SignedInfo&gt;&lt;CanonicalizationMethod Algorithm=&#34;http://www.w3.org/TR/2001/REC-xml-c14n-20010315&#34;/&gt;&lt;SignatureMethod Algorithm=&#34;http://www.w3.org/2000/09/xmldsig#rsa-sha1&#34;/&gt;&lt;Reference URI=&#34;&#34;&gt;&lt;Transforms&gt;&lt;Transform Algorithm=&#34;http://www.w3.org/2000/09/xmldsig#enveloped-signature&#34;/&gt;&lt;/Transforms&gt;&lt;DigestMethod Algorithm=&#34;http://www.w3.org/2000/09/xmldsig#sha1&#34;/&gt;&lt;DigestValue&gt;CjPyC2kkZp/QXKFPz32TZyqLtSI=&lt;/DigestValue&gt;&lt;/Reference&gt;&lt;/SignedInfo&gt;&lt;SignatureValue&gt;IsHks2WaC1Z55rfPLOVYa3GndJ5LDVoYU2rvs/d6+EhpMHnDDDhRQsZCuFgi61LlzuaxneqJ8EeJ&amp;#13;
// UwwSN4ZT67BYlT+LBdDYIn9zKPqtC+RAKlJe5P7IlhaWG89fd7eFCSTY+EPHCXOwY6gfPtv8LbIw&amp;#13;
// cFrqp8uL2fPCQ1WuNAU7rH7foAMhMJuQMJwMh4JoSPtRv1QMAcoNbLxIGt6ODQhJwaKED3MLYklw&amp;#13;
// jSlgcINbyVO9VRUThEwX3LLH7r8ItmjTWxl6NIDeBF0KONRrZHE7bJKz6AZMN54yPhYG8eEdveB5&amp;#13;
// SXG2YFiVbDo/gqa6wFGTGOAimSt6rAsQYHxtBA==&lt;/SignatureValue&gt;&lt;KeyInfo&gt;&lt;X509Data&gt;&lt;X509SubjectName&gt;1.2.840.113549.1.9.1=#161874727573746d6f6e65792e74737440676d61696c2e636f6d,CN=trust-web.trustmony.com,OU=Financial\ ,O=Trust Money,L=Mumbai,ST=Maharashtra,C=IN&lt;/X509SubjectName&gt;&lt;X509Certificate&gt;MIIEMDCCAxigAwIBAgIUN22fVrYNRon/5XfrJ3QPSjVFPQwwDQYJKoZIhvcNAQELBQAwgaoxCzAJ&amp;#13;
// BgNVBAYTAklOMRQwEgYDVQQIEwtNYWhhcmFzaHRyYTEPMA0GA1UEBxMGTXVtYmFpMRQwEgYDVQQK&amp;#13;
// EwtUcnVzdCBNb25leTETMBEGA1UECxMKRmluYW5jaWFsIDEgMB4GA1UEAxMXdHJ1c3Qtd2ViLnRy&amp;#13;
// dXN0bW9ueS5jb20xJzAlBgkqhkiG9w0BCQEWGHRydXN0bW9uZXkudHN0QGdtYWlsLmNvbTAeFw0y&amp;#13;
// MjEwMDUwNjUwNTRaFw0zMjEwMDUwNjUwNTRaMIGqMQswCQYDVQQGEwJJTjEUMBIGA1UECBMLTWFo&amp;#13;
// YXJhc2h0cmExDzANBgNVBAcTBk11bWJhaTEUMBIGA1UEChMLVHJ1c3QgTW9uZXkxEzARBgNVBAsT&amp;#13;
// CkZpbmFuY2lhbCAxIDAeBgNVBAMTF3RydXN0LXdlYi50cnVzdG1vbnkuY29tMScwJQYJKoZIhvcN&amp;#13;
// AQkBFhh0cnVzdG1vbmV5LnRzdEBnbWFpbC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK&amp;#13;
// AoIBAQDohTiEGboZy3ekpZll5nA4n/EkqQQ5I/KWC2FmVB3pEmmAIu1alUEP1Zi2D1wf98ZWH5V5&amp;#13;
// UfFiVo4wsqkDTfuyuV5DfVulo2b0nCik5jihf8EBKYQ/Kevoh1IuL5ndyoYp5e/NxxUDND2YqUnL&amp;#13;
// jzLF5K9gaSEmQYL6BHrycpUCX7f6JRcFMEIpiLI0h2nN2QKlO7F5vOYQ6i84KUw8WCb44/uHeNCd&amp;#13;
// Gqp1+QcU7oJJ19ApM02wqj5cpbHo28TRcMM6pHi49I8+GhiWM+dxan8B2B2WQqoWwg3cu5go01lN&amp;#13;
// /fUjH+M+y+gyYKMRWWL9s2kbQe1LYEJOcLXvrHPAG5p3AgMBAAGjTDBKMAkGA1UdEwQCMAAwEQYJ&amp;#13;
// YIZIAYb4QgEBBAQDAgTwMAsGA1UdDwQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUH&amp;#13;
// AwEwDQYJKoZIhvcNAQELBQADggEBAI9KP5utAsFC5ZVmHq2f1U31+ZfXPDgbo7jiLx/rG83hXhZY&amp;#13;
// mmnAL6+FmxZdJ0IHm5CSXr31cklHhyoS7CnyB+t9XDB+HOK6vaoVk/o9DhvY2oKBsfxLmWJUMIqW&amp;#13;
// 57zc95mGLKJqN1DaOvJdSvXc2BUPtqn48MEnUeDjvhf8HlGqXdpWP9UCgd+4jIy+Sv5oMlnBcDCi&amp;#13;
// +1hySE6NgQ+I/ojGtFeMsOTIOSaZ3co6Ajs+jDnuF+zJfRyOtWWHhyG3FFlzSWMn3jcg1VSQq0zy&amp;#13;
// DMIbnd8ObHwRGPj2JbDbTp5zIDzpX0ju/SOSuDufxBVVJI6FxuKBXMbcZAi8W2XL9vY=&lt;/X509Certificate&gt;&lt;/X509Data&gt;&lt;/KeyInfo&gt;&lt;/Signature&gt;&lt;/Esign&gt;
// ' />
//                     </form>
// 								<div className="content">
//
// 								</div>
// 						</div>
// 					</div>
// 		</section>
// 	</div>
// </body>
//
// </html>""";
//
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint("================ yu3truwertg ${widget.response}");
//     return Scaffold(
//       //backgroundColor: Colors.white,
//       body: Html(
//           data: html,
//           ),
//     );
//   }
// }
