Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F08752758E
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687422; cv=none; b=cTe6uJtylTXCFhrG01FZzZPnSwsdCkbQNjwN5PUCvKCCkPsG+0vYgJ1RJBj886I2kBWvZW9z1Tn0ThzNYGnXS1XyMWaX/6/yJsnqcEmZU1Ga8uqP1Re5OyBj3eMVaDeUALlOa5+kzp+Gd5fo3hhR9p/TYz4UQ0MZrKc/Xy4R9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687422; c=relaxed/simple;
	bh=0roK4/UN1hPU0Gu9Nf1oUEb9cysvcUMyswTmN4ms4pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLewVy28NK+nj1jMAul2QQtCDOeZJ4sYyojlczetfhUaqSBI3+hMhz+6eNqCbNTGggkX98wcx1iA0oOVaFZafPNzBZWYooEx8kpzJX/nY6EhOO4EYiAU7j75q5pjOOi6kbikgfTeEDuqi/uxGix8jVYvXdEO2J9G2mJdxe7ETf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifMJ6F77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0mkl/7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifMJ6F77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0mkl/7A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiGt1477150
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YymFEpj4pY2BPa3HsmXSxzEBxgkhnRQzuFGF+LWjNcs=; b=ifMJ6F77Q8/rbkf3
	+jZ/ebFyw2xm8xSRq4H+25yfs/ZDECGrTn5ueyup5DfEOUzZUNqX5m1BkLOh4Rb/
	xa2smgrGFXvlYfuR8lbzDokfOT2kymAP69gwVmQ0AwCk84juYbKD2WP0bSMu0SN2
	n+5JfwG3XAkwWKimSEo+n3yVjVEY1GKbxiKI9Qx6ZSGr/VmFJPevo7YBh7l0TBek
	CFGX5cXoaylRLB/soS0CqDir4bUoxq1JK2s1joV5y4FOIZ934K/rZizd//vswTPN
	SUmloW+kQg9yZLKxBV87WC8dZ60Yvz0Rv+1cOlzSQEo4yVYgLGl/OBjyrf916mFC
	54ZPEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m682-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53328840cbcso85122581cf.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687419; x=1791292219; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YymFEpj4pY2BPa3HsmXSxzEBxgkhnRQzuFGF+LWjNcs=;
        b=X0mkl/7AnG/dnBCcJ/IlzuU/SfQOVsnPR+VtEIVxSHLw3xJSkTKsCo1KeW4uYdNOE7
         4/Po9xHhKTqB4iMF2VVcZGCPCrfuYD4Zg6u1/t+OUQ4EBvAPwSBC5LQB0kwKotDHK4AE
         /AJtuOxxlqL2cTDwG6YRwDPGM1ncn5xZD7CwW0HTrQBz1lEYw8lx3uT+FdvPzMBVOcre
         Om2LGxhugS+fohnRShjtEtRdrb28H3UHotjbhlogT4bXxZphGptfLgZB2Jc4eLdU9hiN
         EaJwhoeNCkjhjZX86zx887wtbE2Rw+Xo3VtTV3LpBKjhLPZ6QlmTAhaTE2W66h21Bt9v
         Y20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687419; x=1791292219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YymFEpj4pY2BPa3HsmXSxzEBxgkhnRQzuFGF+LWjNcs=;
        b=yHdMw2CbeMsja7eO2AS/lrb0ADrlAMgwSRWQN+YNgXRWnZnIiNQ9MfY+QOtSDlyy+f
         KL9KdbeT3ffmBGcYc7tHgM9k+//nhpeZ2LWh176V9rBlrK/2IJrJiYl2A2b0aCjZIDX4
         vOsLI9ogB5CE4BAG3VaKW2hcAQScrJFwT7lNBrr3GSsCFl27V2Ic1l0TpEclDfAvSROr
         Setr60EBAZKU3gmbNeucnIFouBdqg3pYw+Edc9S7jLBAGg2AJaux0VCAbQVnnXOYZXFb
         zYtj9FMkRTYjmxvTAW3Q6kluLIin291nGnA5cj2l2KulstkFwx7O/Wcekis+u8RvbiCa
         e49g==
X-Forwarded-Encrypted: i=1; AKwUvBw5dCTYSK3twF4mmEOJMFNW/RTkgDG6mSsaBX/MW6PjAE+ZPgo936y4abqUlicaUBiKdXk=@lists.linux.dev
X-Gm-Message-State: AFuF++mNjxXbTnQOQ0jE9w+E+lR6qQLl40XS2jIlhttSAGq7wxfpxlit
	lltiutoN+L478fIJPNHE9fD+Nas9kRJuCgNo+IRkBY9FLt6msSVrNdAK2PM+6v5WUnTCv1KungB
	s8Ne4r9mwRabBzdYugSE1zUcJp9jK/Gc4QLmypa1pl9UTkX0oC20XdRw=
X-Gm-Gg: AYBFou20T+MqPQLD3oDzvUplCqRUoG6hr9X+RFJo3KLQsfiNC9+Xr00jRe2hzBxsbJ+
	c5YygGZ+NPttuowFMe1zMJ8x0b4t/8Ur1PoZ/1gzORhN/a+w9l6sUeda4qDLhv0BkG8y7K7bXJd
	l7rznR1iiv6btqeqUeAkhDqal6npCApvMX8TzLAttaseIRNHxjKqgGFHn3r6WPvB2DAqKB/ZSHc
	DUuKkZYHGqjoFK/j49rNyfXPoStyJjqHY5EYR/hX5sMZuGB4mg69hKuWU8gry0cbqhhJvKe3yx6
	wBmwr0arUAEcvYByYv0FW7bnr9riUR4XTxF7weqKRhIfE+Rmkx580eNMKlTKNlgx4s5vqhZ3Z9I
	fITL8BgMlHBu+QoqcNhgy8Cc9AvLOpQPrVj4=
X-Received: by 2002:a05:622a:2a09:b0:533:24a5:f3a2 with SMTP id d75a77b69052e-53324a5fd8emr185002611cf.45.1790687419010;
        Tue, 29 Sep 2026 06:10:19 -0700 (PDT)
X-Received: by 2002:a05:622a:2a09:b0:533:24a5:f3a2 with SMTP id d75a77b69052e-53324a5fd8emr185001471cf.45.1790687418223;
        Tue, 29 Sep 2026 06:10:18 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:17 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:37 +0530
Subject: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1167;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=0roK4/UN1hPU0Gu9Nf1oUEb9cysvcUMyswTmN4ms4pw=;
 b=UMf97heEuJtAno5kcDZwE2crP+mC87anY4pxpQPeE3ZnpLyFvckh452UBsl0DprDIT+WIlZSm
 C/an+eRvUXMBkx2/mX3UpcdP4SKu80mhKq7MRD1tGbQ4KRRHpoUXt8e
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3MgGispMhRo9
 lPK9/JUC9uGjg/sTL8NVE2fhF/BGxP11RuYISEg7YNbNRp4lqmdvtNurhwTLyngnCyVTlZ5TwuI
 y3y1GGkdeyPkH7digxmNfO/M7JzeYY0=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbb8bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9KQqHO2nx/22
 goM55wOdXmjs3rvHZLuts4lontpiaNljmwNenj5q3FvFOYoyghMz/MNuargmqOFCgPHr9yQl0xl
 1E2lkKWBU0iu7cqOPuLSEyQOH5b51JuIrr7kdxgo1zLuGFnR3UIrWW46JHXNZOlfePp2rwfBk/D
 ZxHuz38Aa2gY1E4cEEtAP/2X/Z1jXPPDEoCLMwnrmEmxM8C4Bjnyk7pf65oN+srJ94pH3K7Lzsk
 6RifEq2z0mh3eEYBNxZDWRGvM/BbSIEgL/CYredf9kzRYX73zv8Sz4nvgJgRPa86+3vWyT1OvZ6
 M2vGrjzcDvm4psYtdkoJyQ02pR6QCiRiUaQ+PeJsa1hdaq17W2TT2sL5lJUohwqfkOx8m1KmOyj
 h8gPa3KwVuPM7KiBGDENoKpPuVt1YC4DO446XrC6c+7cU+RyrqYYviJyDMULeFS0oOCEmaat7IC
 eiafPj9lls6ol59FooA==
X-Proofpoint-GUID: Bf0-dWgRprxu3BhUUALOiSgyqFhRuPun
X-Proofpoint-ORIG-GUID: Bf0-dWgRprxu3BhUUALOiSgyqFhRuPun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..9cc734001a68 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

