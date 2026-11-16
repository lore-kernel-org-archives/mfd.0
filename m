Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809660;
	b=S9v/0PH4bH+RoVKFFJaBbC7Z2E/+In/QNz8lA1lZnnTHylCS8YJi2jek4LJKNcU5XHeG
	 505m2qu7Ci94LsJq2rsr+0iG9UgrMH+gFgkzw0nRT/VwQVWt9otgzSRGglGALdsTt4jX/
	 dcQsEsXaGrv4J9b4W6NfqmmbZXFMv+i8QcP/vnnGCic6DL72ha3LwYUNMurBekNy3Wq2w
	 z4UyaLrbVeGefDOlp15uPahmkcqxqAUXEJXg5JpWK5XEfm8hxptkLFF2Xo7fRtj9mQb/9
	 a+yMmZ7p+Vi2Imkz7hwAXIhFrGPJySq2ruw6JYC0ruMQrq7DP37EWlIj2TqOZtCZyDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=I9rgdfJdqSSTXvMqd2qSyeJ/1CxongkHyiiRW8+X4TZTNFZguxin1GxMTmqwy9e0XMIX
	 FZidRzOxql7hKN+ystmclmz+ZW2J6jtHoL6PaI3HGCYyoyvxs75hta3eRkKUJnsp/Ykjg
	 VFQAaPOaxTJ1NadH7fjeQeVonPYbqFJQAmurgxhBoPwio/MSqsJZmERYh7qUFpJkaRIYZ
	 zON3MwmR80wXlqqSpZYcV5kXXuL9JnrPEoQtG28ch7kw1BjomE42dpNf+4Is05pnlJeZe
	 ejc0HWk5JL7aPgGRBnjGIMUgZvBua5mayPZEtKcy8fW91DGRpv1hHtJcFyZQXNzCXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4OU53Va;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9C606A323
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A9C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4OU53Va
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LbqU3839121
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=J0wVNYO6ILmcjvju
	7iC3wjRXx6HXaui59q8Puaam3pkqhlEF5zwa5AYDOyjyCEiFGLlhKrl9HPdz/iFG
	kj/H+ckuLBaeLmhWksYH010OK0UJ7u2wUEZ5d6C5WdJf9HK4Eu0pdioDPtJA1Yyg
	V+FZXJMssVqyRtmwoRH1YW8UR1yKiJ9ybXB8A4ZBMhNU94Zkv91mjF8W8PJjSWN5
	ylkrwYCcgr4gMA/H/CvIp+KGgDhWbeehIOpS76RBGPXpSB7B1n5ddo/K2XLgAY8i
	yO51/Ip2KLSNgj+BdAORyUMWLJE2+LSnlrNK53OidUYcNqFLzJXzPlD3/cJcrkJS
	fZvsJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhn0uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so5406059a91.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809659; x=1795414459; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=O4OU53VanZD0yAKGzU93bYF4KUyobBqFbY/pWE+vI7qmUY5ubxw4cs599KvHtgLzq2
         UKEFdD0knMBVQ3wvC/UYq9PkqEcEDddGnqeHYyYkfyQyQS4ofT/BlFzM+ODagkpzIaHj
         z0wE2Thc+OgIJ4psFw2ngBPMRd7unixzKVrg0vvlvRzqkdsVj8i1Yj73qrnB1lw2ke6T
         g+W3JhPpmZmhAyUUA/b8YSaiTRhmHoir0nuDTJwUYCHd3fP/5ooBCaYKlz/r3ozRtAMG
         ktceS0S0fRzIxvdrVRhTTiwMPCdh6VZUSWa1zsNzvcG383KKBZbNnGikVVgth7kTowLE
         xFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809659; x=1795414459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=x1yVpADH7bT3bPWnNtIIRfM/VOgpOaEyiFxTt4QOoFTFzPuKS724FxMPBR7vpN+iyY
         NlYARiieJil8Q3AamS6bbwcdG71GJFlItFuEVAMlajlk3ATJ2J3GmV5mlw98HRB9NbQb
         gxClZ5jQo8BfpAxGtreTrXLyodhtQRJg6tY+x9WAQGaAq73NN7SRXVM/DTYfRc5jgEw7
         VpBbCkffWn3dEdKZAH90GtFxrBlZLOn9pb/ImN5DJBZ6dyIkWOOHdJ5mVD0lf8smQdDv
         hFodghXqwGp5VtQ+bpHQv/Ni+OpTTFiTybYl+4eSHeEF8qxGLuhrD5Ij1ECAL5ZJiWMD
         Nl3w==
X-Forwarded-Encrypted: i=1; AL+hErEWZK9H6j1b+8O6+Tm/KjszPbiA20iVWcBiA4Ok/5x86LFBjXfFlF7fAr6UXb2O6nodQ5U=@lists.linux.dev
X-Gm-Message-State: APuU4Z8gONcMYl2H5C1rHNAikL2WUueJ5Csnu3zDEQEif0OA6SSVhDRO
	T1I6FHFgNbvsDoZ/ElNz788dma1Z1v+OnrOvq7ppq6fhgSHKunwwj5DjE2hlB2TmOhIYQCFbzWk
	+KbBpr5VlvB4urIX9F4ENPbgxDJyE5SbRCYBohNXSAPQjxn3D5RZAcHY=
X-Gm-Gg: AZFdTZeNz7W4c8DLAqbokO+0HSiAhNbJOI2396i7/h+wuypTHa4hVVUTeN4vZ/jwj1P
	Bn1TFpJFK/ic9eZ/PJkfLmsFSGBscSPRwv3Q11r12PPMQ2soic63SR4uXFPq8cvfQMl4QCFbvCJ
	5113QIHmURWTaI31PZSk82mfg1avtjlZYNx9AR65RyHh03dPvSCnsLzdi6Tw+v0NYYX/hZSkBr0
	CdHOSAtt65mtvHWaabEskCrY9ARNkmkL30qNeqlHoAT3mPX+d2zPCp9Lo182DEklmq/j1GV+pyK
	wbTxjk0xtEoKhQP/6mqKY6pZiOkulkSURa7XPhYzJWJ/lNLocKK0WuOIe2V7Fv7CkwbKV/x798a
	PRfjeAV8a3YFnybAOnju6WZKGnm4akQcysmxs6zAX/q2piAJigeg2rCWwlSFS2gILK+GO
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498342a91.46.1794809658906;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498331a91.46.1794809658504;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:24 +0530
Subject: [PATCH v5 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261116-pm8010_i2c_support-v5-6-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=rCBCJHon6H5ChuYqrvX1bQDSdX9GNWCh1H5WAFECl0RDZXP0CgRQUQ3kkFoyEGLLRo39/+QWn
 KsXwZ/an8HNDeRcgdRxSxyYX4yUXP8fcAu4l+ns60d2na82HAeTEBUH
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: wWl0CMrK0VSTm8C6hUiQaM-8zvlORuIW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX00ZnMnpLRlpf
 XvTqZ6ZmV1w4a8R+akGKfkITB9orYhMc+CKiYhWbYwCZXogRxR6kEsfNgA2l9Tvlu70BNsCvJaP
 RHByouDChJQ8bt6G4Cx1eUmB5Qukj2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX7Guo8T5GenLR
 Hdh7Pi/0oX09XZe0H7ilD9N/d0lIxRgRfohTYehOK55GFhYSnup0S2kfORDDI6Y0idt5+7+RTxH
 iAfN1z17++s/owVBQtawOEb4uKk621ySLJT1+9iaD7bPx5kb5tE/1Su6w/FEQuCrIIR8gOT8c/I
 GQ9iKgmrxYex2VqFzklqr7VM3CY1Na2GYIJKdcnSkdkon6eBl7ssU5U7vNJ73iDJD/Va9j3Ersb
 jkTRPNWEc+Ny2r/exUMZw9V3ArLNitMnYSWcnD4SCevZ54tJ5OW54BW+7aJLoUSmg4/4An4GigC
 xgcEqMBFRkhBAuGwTWP0AzcbZ+A6v++oOPjAhgLq5GLGEtX/9QSpGWQPUBhou5BKBA6Tllj/3w2
 wKFTQ5uk6RoSZeR4ahlcEqzWYudWgRmTBCdjxDPpZ5iL0FXZeAbvbbTXsTD6muPYXZKn4Wghf8v
 btDGAOrskHB7eiNqHFg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa9f3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wWl0CMrK0VSTm8C6hUiQaM-8zvlORuIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

