Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864471;
	b=0JWGT/Yjx+aYm9e3MdEA6nA3FyEitW+2dSX+/b/QYu+lkpjOJvJDDiazlbXv9D8Kt3gE
	 sn44QjZJVtd+Wx+h6xGvKPFVXKSjP4/1zUpECBrpnCpLSXXauJbNrCY44/sqfFTZ/Cfk5
	 Xma3K2gyfmsIcNEIFjJstyBnfB2jDkFJhDR5snTcPMh1UJ+iGWIXu8VzR8cji1PRRAZY5
	 9lY7/REsp2v8OBlh1DfSS0tkZqYXrNGZHlGkuJmIi+Q76HduIsvHyALLmU2Ivf1ZIiiEi
	 2X3UciCoIl5s3Da4+ljZOpfbNClFJxDMAqlGBd8tXFwOPXKuOguTbd35g5PDRHqAvww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
	b=n7zGIOwzwD4lmaZr38HxxC3z2HiVpUuuqs5X0CytLb5a2EoDwP7k9KJxkY9KK+IJpAY/
	 /yVFvADMpD5iR/Kac7ZX0yZ2/NHWoupNkmJr0RMBYtnrHg1+r2LngFrIGTTn6jYAPp1jm
	 dwZDfhwLDdtTa9SXNYSEfCLTnPutXaAAlEzDH4khDipkr42XJFhqmdVd+9RPf6eSrq8wW
	 32pBr2kjCkGG2cb+8lo6F4UvZEJksIRelvC/B6K3HNmj9Kw3Bz21s56tGoiehFAfkd3th
	 mqP4/unDsK7WRnk950krTRtQG/Whkgu8mlSdit0OTLDM/70EHzkFuYycEl2fNc/DrIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDRfpBnz;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A23606A331
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A23606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDRfpBnz
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so1880665f8f.1
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864469; x=1795469269; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=XDRfpBnzVKpOpfkz4tdK0HQahrVPJwff1eI8mO95WL9dDgSEngEdZ/4WqRTPR3kaQH
         Xx2ppz3DW0ZeaS1x+5CZ+hwL315TgTHGLRBT06oPXuSvIAattJQ5SaL1C79k91a/BRPW
         ETFr8OFvFOIymcFBgz41qzknnVEHCiyAQ+yCpef/GR2ztZq2dsPaOA4l0msCQ8DBUaM1
         eTCn5ZzUeWMJydKHv2xqcZ2NvpW31X6zjW99XdlO0J1bIpnWpdyZ94WKPAkuOn6TpQZD
         DxRrjNV2GhtDDgQsYLZG3k3kpZoLttQRx3+xOWhg31s8kA2nn4u3f+xTwlH9gPkLh9UQ
         Vy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864469; x=1795469269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=evJGDYb7v/u9s0sXeE1SY4c9YkY1f9iTE+BQZRNkSg+/1+EAaLzI+DIdqKISqnIK0V
         GEuNC4tKG5KGPXLdp2fKzVrok+4phpr8BENqokn077kzD1p7wk1FOOtq30ShV69vHSFF
         rdN1+hvnSXtIn/U7phaeSJXG7RsOB5D7NxFf78XR+qK+/kJUd5pFl/2RuP7ohUtqcElZ
         +FVr4SwBVOAICVyYyhNo85vtTzpAF/B5lSjp/kdLt1iWMLpSzPnfUaL1g4J2FgrSy2QV
         o3BReXHChZMa/zZfo42Qi6jaZ4aBMIEATFyTRs8ZYUmNTc/GZbfM8R53Kagr9eZiicNb
         RyNA==
X-Forwarded-Encrypted: i=1; AL+hErFivYTIf1bYMO6m1LrvK2A4eCRI9CRDZspjvoznuu/Ct/FjEcpGGgIwiw+Kdc0PNC/9KUQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9mWtkb6rVFu3HCMPa7svDkQvXbYZnFc7Fvkh01aqDzxjimjgSO
	Yd3MIuoB/ymNa6RkMn9q7O497GiZA/W0dSw/yZgb6imfIEl460U0KRt/
X-Gm-Gg: AZFdTZct1SjD0nfSQVMf99PX2mEfypwbngB8DSIpBDrzenc8hS6nK5+hQVvjzx/O47w
	2RD2tB36AQYSNv7pQtSfARf6uZV+gyA6hymTHJFgkkTsg2VD6tF0WzzApoShtOx2RudTO7GynUq
	mh4PDBQBeZBXM52CNpQSdK66LViTrl6YzJULkVj8EwLVS7x2bILsgWjNOerLPcMmgRE7SrnIx9w
	0etIJNSMU7Z+CVLDLja9fkN2xiwiKjLpSAj5XyMclf3rroBakIPiEoBu/G+Phd7R6Ii5dOilNYr
	AGCQUNozR5IgVDU8Y3AGomuU7vQSUa5ljXA8XwDHlYeWHnbfjUzSQFGeVSYLa/yCVErF9KLFdRd
	6BkIFCGRS72S2niMF8QgTNQc0tmwf9hOIHMO9osF5w1PwGgLbkdhryWF+P6ErSOYr+OpjTBMX3u
	9+j6JP2gCouTsoClVGDR7eEhvHHSYuUotg/CZLHwqD7K+6elObVa1cAQFyErhJOd2BPK2CP+6Ys
	D72hAhYOWcJlTY8vM6FTIeMNSj4SfusC0v+QuvhJQ/prHOF9jx5+5wEkt5vUPXfJCw0XG9Ndnpr
	dElVV85dNrEcH1l1tl97XX1y24cBtV6Iyuwcxbvu
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr24445384f8f.13.1794864469242;
        Mon, 16 Nov 2026 13:27:49 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:48 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:28 +0000
Subject: [PATCH v2 12/16] dt-bindings: arm: qcom: Add Samsung Galaxy XR
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=2338;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=8VdPKIubIS5rrskEMQXxsc4CH/xmK2NlYtvs6kfcSuc=;
 b=t9apGIuBdbCgnaj0/1UJjnpEZvArnjOHWwiMxnYe/9rnq7pKBOWl7S4p0La1YJLjWlXweFSEs
 dlcpSLrFw/hDB74P8wfi7SGdvZuxbRKq1frXt0fWIbXohJzyyH4p/WF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P), and register the "halliday" codename in the
SoC naming convention schema.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..9d392329d437 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2a77382a9f25 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -106,6 +106,11 @@ properties:
               - qcom,glymur-sip-crd
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0

