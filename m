Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764E4DDB33
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772383; cv=none; b=mk0gahNONkfBa+F+Mz+LeV+zK9ZuLB6Z2QnPvHZT5Rp0FoV1faPrJQozP6FjVF5fRgZpWifjyLULoNG/E8loU+k67ythdZ9SpTPbtmnXNJI+UIRoDCsF1MF6EbpMI7HfU0VNzKT8gl8A5ptPZKj3k5g2ippaam50CkKRGs/nof8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772383; c=relaxed/simple;
	bh=dLk7fWdCBteALwvoZRaHU9oeqXBvnyQuhJNHQIKcy48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAY2ztHy9ZZNG/GBiAg3EGVof0FZhCSu+X2W0Zb9Qs1aNm0EmwsrJOyh9hpazBUpvzmykf2RBN387La1Y7mQW+8t772wCGGAo7U3/gXv5qLAfKeOR0FBowGSkDpQWhLryZP9lUcvAWzUiBLBtAwgWXqDVRhiBt+YXP8/yq8bgms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqfTX7sv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3SeK+Ya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqfTX7sv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3SeK+Ya"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7aFj319187
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4c/LfuCxFPo
	u3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=; b=HqfTX7svJQrBKUBq2i4H1KAizP7
	+vtBPJtmvY8oJ8PdCWTMhhQW8XO7ruatv0+gQqFpdn5q/1v6dmJUsZI4vpOVj6Qd
	2OIQM3Zb2dlXY/cRAtNOCOfzUEOvfQt4oivT7Xilbn38uOx8c/y+pylWIUIz0Ulm
	MT1jEOuxdCDIPX+IKhmsgGXeyQJ5wx8+615UtuFO8HsHneVqZJjvGiX/NUxgRcJQ
	oA7PRj9UdaUZnD7xtT/j4x+SfbITyWFcNFpUs5D5q+XcTvYJnMqJbZGxWL7H0fPb
	sm4ORB83gOqU4NVEWh+vr7rsD8ONvdtuykmxJnr9WmievdWs3ZbIFeWr2wQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfabqpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b335ce0f18so710723137.1
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772380; x=1791377180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=B3SeK+Ya1fcPjwCkoT06F2rpAP8FDpjtNA5JksC2dxxjEleMJbE/GnrX4cwMcNGFMS
         GxvT4bPNPgcHpJG1Nw9tH9eLxaeZj+sOEf75whjhIfv8/5U8hxRiikZ4+WoOHHQVPehD
         vBmaGgYxFLuY6eCfjHm7foKlUkytHksh3Ttp3O5shPZIj8aJoUS3guCT462MohMfBCRO
         fVA+tMzhTCe/oZuQ5srqAjTxD5JevQaqExPuHvxMTBKtED5HOVM6XzXqKxCpLogxdtEt
         vmNNI8Nuqa+UI06RJP6/UOcowQw36WRW3CyYUJw0zxel160LeEfIH9q0ajRNDm0Da7j7
         i17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772380; x=1791377180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=R75kWCWf8km6LzdOEIpKVyjk7F75rDLQauNyjzXsNTL0IHPWriEQqRQ2b4vbH6JnsV
         1C89VqPzd49OFbcMkrbCWBiafBufD7oCOgKncDG+wMSf/H/u3/oU+CiSepFyMD6Tyqj/
         jOUbc5cAlhYJbTphfqXyZS6SLGWFXOK5+yRS2et7Bag4MwLSLItfTiazEG7oB356LuFE
         CRT/ngmeRdOx6CEGV3ByMMRj+hMaLjGhjzYJZsDRkwpxiBaPPa8llemL37nF21xiY7oN
         KJE0VHRL/ftMAGVxkqDIR6LyXAsn3ctfPZaZ+XqWYGpYFNenxryQxOLEjhb3L5Sv1uIe
         X/0A==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZS479vtIshCfUEyNYU5vWoG2G2e+qA9nuJPTZbnkyYL9l4lvzqgEWUnWTGG15ilzG9E=@lists.linux.dev
X-Gm-Message-State: AFq9FYKG7wAVyyLP26HoTymIoNgoqVROTHHbg1CVmvLF6MCBp2dR+S7T
	qisCNjJfQCMtNrspR2DSseQRFaWWYxvHXm6E2XTITNMUt1FXJ6BfbKE94LASzy9bDWxDh5mqxe1
	w2GIBmEhs/z7lzVur/+vdM5GEhAbH01McvLz+WxUTc/j0snHNVPZ0sz0=
X-Gm-Gg: AYBFou3GneE+M8j5r2QyuTu3QjFktF6AaVxQvPjBYs3w/eEAeB29vB4W5CwhFy+scG9
	r8kjZ1q4ZXsrEVf/lt3XVBd1mWwOZiwRf5jdCSSWs+wLaJf21d3biaJ8t9YRUA4GqyUus35M/+p
	lA+yVwBjncQtPYnFedpesLq1shdr2raen9qp2E4JIFRgIcZr+vrxDiOBy6ly0niQfUfQjeDSdK1
	K5U6wytYbhrMzVwJp3XJd/rV3ga7EKRCVU6j8htFFbjsPnA6Tp18NzEQ/jHrah6pMhrHrZffKkl
	9gqt2DNNpIyKJ531jrxFkn3b4as48MRX+nhX8P8uNnl7vpttUY1bHiW703Dqs09NbEFLCPlmZSv
	KHaWAokMwpqWI
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188602137.4.1790772379722;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188588137.4.1790772379200;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec
Date: Wed, 30 Sep 2026 13:46:03 +0100
Message-ID: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX27cWymqHKy+u
 4N8+jTABrAQd+NNsF5hoXWusrDy4lFH6VcocTYPWaOvPXVKdGaRYZCfLWCj6YvN+k/lJAYuRR5I
 XTFop3cJmaoFF0DEjG9I8zOcPjt7sZK8TiA3YJqwYTaNJ3V9W1OK3nXlRWcwGbYBKcQwm9qg8AF
 Y43rjo1OwxjPfHFFbDkVhJOy6BKZv699Jylw9dUpYLcBJRYeocNf8xO3nCxT3j0Td6C7VYpxwVs
 H/rEkLiK7o9rsZnpsKsehEfjdNMQml5Gz3KeQ1P1hqtx0iZI/pMdnus4xpVsbEgFj5V3fjbCGGs
 dh1jcyOa429nCSaEHarUDr5x2lj59+QYK9VWz9rqIsJo3/4pVIsf6YZY1IzqIDkrYhyDsn5uWVB
 teLqTsdVBX50YsDNo0y4yCqWENOqWNCmQEPeDm+YhEInElwBPR3pvBShgM7MVs7BRubEqp/lovF
 /x5n3/JXslCXgwtVjVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX11w0OLT7KrNv
 XTVAyLEX5kDZ11Rrq+XFK2/FDBfFsCrlSK21zgYqsQGZJ8c0lw3LVZZkfONf03xNL8ktYRJFwyh
 F8L7RwA1CL0yvudDjM6fYr+6ym4D/zo=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abd049c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1S9TnuZ4X9D0nYt2MHYA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Q42eQqf-OCMPeE2m_SSyRzLuQyqZ9ODa
X-Proofpoint-ORIG-GUID: Q42eQqf-OCMPeE2m_SSyRzLuQyqZ9ODa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec
support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..7a889d888383 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -148,7 +148,9 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm4125-codec.yaml#
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.53.0

