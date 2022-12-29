import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ESign extends StatefulWidget {
   ESign({Key? key,required this.response}) : super(key: key);
  var response;
  @override
  State<ESign> createState() => _ESignState();
}

class _ESignState extends State<ESign> {
 var htmlData = """<form id="URL" name="URL" method="POST" action="https://pregw.esign.egov-nsdl.com/nsdl-esp/authenticate/esign-doc/"
	enctype="multipart/form-data">
	<label>Let Esign With Your Aadhaar.</label>
	<input type="Submit" value="Continue" />
	<input type="hidden" name="msg" value='<?xml version="1.0" encoding="UTF-8" standalone="no"?><Esign AuthMode="1" aspId="ASPTFCSPLUAT006231" ekycId="" ekycIdType="A" responseSigType="pkcs7" responseUrl="https://trust-api.trustmony.com/api/v1/esign_pdf_callback?params=19_web" sc="Y" ts="2022-11-01T17:31:09" txn="UKC:eSign:3499:20221101173102734" ver="2.1"><Docs><InputHash docInfo="Documents for eSign" hashAlgorithm="SHA256" id="1">a480278501573a8c53c5d741ea56835263c2897aacd128e65a20b84602d1b9bc</InputHash></Docs><Signature xmlns="http://www.w3.org/2000/09/xmldsig#"><SignedInfo><CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/><SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/><Reference URI=""><Transforms><Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/></Transforms><DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><DigestValue>i7zv+fseexUQSO6S3i94sDDkwCw=</DigestValue></Reference></SignedInfo><SignatureValue>fgizadlI24RGq6kSygtGQLhnNhAEKX9dJJ9w6O4ixsYz80x8bU9FGEgmR/7fyJ4+I6MZ3ylPLd1R&#13;
d7eBB4Jpkv/MMlkZERmsTxeS/X9ilG7PxhEra6cUOMR91SRQC66onLjmIQH6dva9QH/s82yFQBIH&#13;
Mr1MrlGulWyzi5TAnKcnRccqJHJxTcKQl6iEl8OtolLZ1r4jGtlt0ty8P6aCjaFjno9LU3xPoJy4&#13;
gnfXw/cz+Kb5zb9bAkHcpm5G0LImurY2SF2MMZLG1mESDfDtJUZNSDrBgES+wk9bwa8UW1BSiV8s&#13;
Vek/5GuMMsP5b1RUmv5apRs8R65CK5ZuRbd4HQ==</SignatureValue><KeyInfo><X509Data><X509SubjectName>1.2.840.113549.1.9.1=#161874727573746d6f6e65792e74737440676d61696c2e636f6d,CN=trust-web.trustmony.com,OU=Financial\ ,O=Trust Money,L=Mumbai,ST=Maharashtra,C=IN</X509SubjectName><X509Certificate>MIIEMDCCAxigAwIBAgIUN22fVrYNRon/5XfrJ3QPSjVFPQwwDQYJKoZIhvcNAQELBQAwgaoxCzAJ&#13;
BgNVBAYTAklOMRQwEgYDVQQIEwtNYWhhcmFzaHRyYTEPMA0GA1UEBxMGTXVtYmFpMRQwEgYDVQQK&#13;
EwtUcnVzdCBNb25leTETMBEGA1UECxMKRmluYW5jaWFsIDEgMB4GA1UEAxMXdHJ1c3Qtd2ViLnRy&#13;
dXN0bW9ueS5jb20xJzAlBgkqhkiG9w0BCQEWGHRydXN0bW9uZXkudHN0QGdtYWlsLmNvbTAeFw0y&#13;
MjEwMDUwNjUwNTRaFw0zMjEwMDUwNjUwNTRaMIGqMQswCQYDVQQGEwJJTjEUMBIGA1UECBMLTWFo&#13;
YXJhc2h0cmExDzANBgNVBAcTBk11bWJhaTEUMBIGA1UEChMLVHJ1c3QgTW9uZXkxEzARBgNVBAsT&#13;
CkZpbmFuY2lhbCAxIDAeBgNVBAMTF3RydXN0LXdlYi50cnVzdG1vbnkuY29tMScwJQYJKoZIhvcN&#13;
AQkBFhh0cnVzdG1vbmV5LnRzdEBnbWFpbC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK&#13;
AoIBAQDohTiEGboZy3ekpZll5nA4n/EkqQQ5I/KWC2FmVB3pEmmAIu1alUEP1Zi2D1wf98ZWH5V5&#13;
UfFiVo4wsqkDTfuyuV5DfVulo2b0nCik5jihf8EBKYQ/Kevoh1IuL5ndyoYp5e/NxxUDND2YqUnL&#13;
jzLF5K9gaSEmQYL6BHrycpUCX7f6JRcFMEIpiLI0h2nN2QKlO7F5vOYQ6i84KUw8WCb44/uHeNCd&#13;
Gqp1+QcU7oJJ19ApM02wqj5cpbHo28TRcMM6pHi49I8+GhiWM+dxan8B2B2WQqoWwg3cu5go01lN&#13;
/fUjH+M+y+gyYKMRWWL9s2kbQe1LYEJOcLXvrHPAG5p3AgMBAAGjTDBKMAkGA1UdEwQCMAAwEQYJ&#13;
YIZIAYb4QgEBBAQDAgTwMAsGA1UdDwQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUH&#13;
AwEwDQYJKoZIhvcNAQELBQADggEBAI9KP5utAsFC5ZVmHq2f1U31+ZfXPDgbo7jiLx/rG83hXhZY&#13;
mmnAL6+FmxZdJ0IHm5CSXr31cklHhyoS7CnyB+t9XDB+HOK6vaoVk/o9DhvY2oKBsfxLmWJUMIqW&#13;
57zc95mGLKJqN1DaOvJdSvXc2BUPtqn48MEnUeDjvhf8HlGqXdpWP9UCgd+4jIy+Sv5oMlnBcDCi&#13;
+1hySE6NgQ+I/ojGtFeMsOTIOSaZ3co6Ajs+jDnuF+zJfRyOtWWHhyG3FFlzSWMn3jcg1VSQq0zy&#13;
DMIbnd8ObHwRGPj2JbDbTp5zIDzpX0ju/SOSuDufxBVVJI6FxuKBXMbcZAi8W2XL9vY=</X509Certificate></X509Data></KeyInfo></Signature></Esign>
' />
            </form>""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Html(
          data: widget.response,
          tagsList: Html.tags..addAll(["bird", "flutter"])),
      ),
    );
  }
}
