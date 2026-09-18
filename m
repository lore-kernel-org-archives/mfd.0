Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FB151AFE7
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749836; cv=none; b=XqCd8v1rkM5ZxMuorSFE7CaFle4psCTn6uRpJgCMx1uRG1avW97cfqt6q2QuzbICXIfswt33nxKwlKF4eFtTvy+1DWttTS8KQYINdafhvWreYBtpG1a+4D5aczJkvy7mi/nJSqlTu5IsKOcSQXujEO3lUHW4M9d6+evXPIyVllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749836; c=relaxed/simple;
	bh=SmOcZxwLrBRoIzC1qf0GZGNnF5JE+WS76VyePIbnyJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkRXDpBxUIt4NThqDy0DJgSHBbZC0VCMWo3bsMi00sYP+Q4pPc3Fb5emO7r3yIWg1rPkVJH2zeMmAgdGFUc5VqHYgvuHccDaRpDEKoRiJ6UE4GDeAJ+3UvSd0DPDuiRFQDqFSp31Zlr8kMSgO+HLvLhrVAl+eZwk9sXvEnhsbrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDP42nIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKVbYi1R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDP42nIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKVbYi1R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IFcJot345496
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpIZWkeAtD6jcfZkO2AwjXwIQel2B+tujYx3yuAQAJ4=; b=kDP42nIjpMkvDHK/
	lSbHC1srg0BgRvZRoA+qQpQzqzHMoYD/UjHW83ypqTQ/mTmyHTc820LSY2MpoQnT
	ilWMlsWQanj0ImMRrEqEH1jmcxMkA131ttPA4FwitEt8igpSrWaG8sVFQD0VfHOm
	0MCuw2lhbqpYue7VVGDE58+3cDWaKEIgUh60QBBHz1kl3goQ90QH/+ZJQ35sGg06
	Zmdk4biKVMW36fUp3DQABKqCD/Zlkixh2YxmCD96he+ivg81B8yshgK6Nq/WXXeT
	S1fZUT5WfOQ6KXYVnfyZzReT2JmrfKJ6OKq0Q/3nUUnbac+722hCObaio1dctXR6
	MEGefg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs84a0a0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9057fab9eso14558785ad.1
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749834; x=1790354634; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpIZWkeAtD6jcfZkO2AwjXwIQel2B+tujYx3yuAQAJ4=;
        b=OKVbYi1R5Pt9uAe376ZitesZzH1nOY30qWm3KwtHcGmnpNRm19weoXzLiy4CPn0rcE
         8Z2JWAqo1zYKx81xfd0V9ajmg8kkb1k7ySEKldTN4SJ8tTnYdnXS0TzJHgFH0l8saWxz
         bwXOQtSR9A4OcrWB1vFu+2h0dUXT3rIQcs97Cb4hlTZH89FQjafKydARmk0zjibvGQ9K
         WNhPDHy/0FBG4w5MA/JOapPSoRxobQfDFlZhXbsYO1PHCTmydiU9pvey3K/lnMuywwAg
         X8k3XokILTvqQLl7sBD42IvwbDIoXDLf42hqBnh4/oZ8LRpzebTXHbwqD85PCcly4/W6
         zzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749834; x=1790354634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpIZWkeAtD6jcfZkO2AwjXwIQel2B+tujYx3yuAQAJ4=;
        b=Sd+wKTbClAEHjZMtT/NRNdyHMGbEiQOXTETNSycdC9DO5ap8Jk/1Axsqx/TI9jSfha
         4ECqnwIMASaHtN1MoCs72rmtPR3m7/nvo30s7YgPtxkEuALOYZoL3qh3KE+oZHchS+Xb
         qAJrF/GctBSqy+VwNsOkq4sg7HvSmZv8hIzoug8d24mgMNTPv7Y4Jxcoz2PB5IQah14d
         myDMyQR7CkfJlqUZOUd2ynNP1RYqXbXXFtGQfkByON52DgP6lmERXddSG6IXVyHYnUYP
         OLLJG424efKdNoQXuLc7nKFdfJHDMxZS+yhIYW1FsX3RNARBDVoBHp/NGTDZNQ6tM4fT
         x87g==
X-Forwarded-Encrypted: i=1; AKwUvBxpkdML9uSWQR4G2a3b8Y9D6GD9jcZ8sb0Bs1Hj/YsduPG4F6nAOM/bfujpDDLKrBQHTgQ=@lists.linux.dev
X-Gm-Message-State: AFuF++l9xGEZlSdCTltpdSAxv65YZ/2W0CfvgUsdJ7pVAcKTonQISpBl
	xrvyl54Qc2q9+7+i7LQ5UWlTeA+0VQKuJu1gRw2VBGK8fnUn8d52jhtHVE4zHgcVgBRVTmW/5nr
	t8DBw1T6MppXQMwZQQcuZEEbJISeB0fG1DvGZq65hllqhn5eJ6ZesQm8=
X-Gm-Gg: AYBFou1mPbMz/PyDlX8GB0xgywtxbKVpaZrlfKVeOwYuIZ6hXuHHYhB+z4bpVaCBqF3
	3BBJ+Ec9okFG/BM8RKxJBtqTPA0Oy8jfFIAlSSsBd+X6A9XLhSX00IzlNC3XeE3bjnJ76vfCUM/
	7plxUz4SF1hE+yavcCCkFf7uI0TTejZnaWqspYxAJAJJFJY26+Q3L9swTGzbrxCkpKxh+ih6T72
	GmsbwBn39NbcOuY59fBCl334aC00PiMMLsQm/DV6r1iyFJpyeKZ6J01PA+55KkpT3fY8PzHJjG1
	nysmRKXW2oRuKqiOyaDGxzMtp+On3VlfHg4tQqiaaiq2252IqIwoSEvK4hYSZsDZqb9mkxjUE1z
	kpjgC5cEmCsPO6gov3Q==
X-Received: by 2002:a17:902:c944:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2ddb1adf381mr68054945ad.7.1789749833707;
        Fri, 18 Sep 2026 09:43:53 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2ddb1adf381mr68054625ad.7.1789749833189;
        Fri, 18 Sep 2026 09:43:53 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:52 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:49 +0530
Subject: [PATCH 5/6] dt-bindings: mfd: pm8008: Make interrupts optional
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-5-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=1295;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/xHD3FOa+DH9d/+N3YsM6u54DFXQmF0QPDehR13uSyQ=;
 b=wHZxV1JV6UVITF/40YIn3ESxFXBpkPJOBbsu1wDFDKZIQ4bL+FVDu6Min/+3FwcqwCijRT7br
 zEiwnzUX5tNA8IeshF1s58Ir6S4oT6qBtqyIonff48QRYxVIFtXZ2w+
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: Y45Dc88TTWcYMnuG4y94mbjQllieQMm2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXw+ouelLuobpx
 Vk/w077MwzhAuS3DsOnKIik0xr+s0A4nxD1g0PvNomHLRUHBSmimKcjWie/eNokN6kPlhLMI8dr
 ML3BSE9dFCXeztwv0ZFeWfSgbcNMzt8=
X-Proofpoint-ORIG-GUID: Y45Dc88TTWcYMnuG4y94mbjQllieQMm2
X-Authority-Analysis: v=2.4 cv=MLD1C8Zl c=1 sm=1 tr=0 ts=6aad6a4a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXw+ov3loOJ1eO
 CDjtKbYaBtZp2+9/a54x3Tgxyg4aTAH6edLQOqBoDWeHmUyNcDdeclzLcx70+bfL6B36XZJTzWM
 esSQlJrDB3tF1MR9+G38HO3RUjKJPzJ1c596x2w+8RCBK2tIH0aucrJVMhH4MEQ549EJy1h7oos
 lx8K4FxAK0hHf9aOwkp11PzmBgvLXYYQn7jYK5HuIqvd7I3BDpGS18d5xRcA6SUCYR1+NFhVNK6
 39odBdXsPOjLo7eUtdx9sputNmZ/Y8rSaevXIo8HjjKnzCS3beOv3vAdqXNAouaJOQfQXOtrXZe
 L0RbbNRPt4VNj6lR2lAIhVPQYFSqNaFsQ2j7366LijqSBxhHL+RLxpOXk3zRUGFJLQd+7hujtf9
 glhMEchbQt1thdQrrgQHbp75KAXCB4xIFM0v8VhJ0sJlVdnpQEAmnM9SnYrx4/kvxjL6v4cWjTC
 ZqqcQHtz5mr+Mf/igVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

