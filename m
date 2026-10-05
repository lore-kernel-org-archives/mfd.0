Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151547F793
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203150; cv=none; b=PXMrbwtTYUA30KLNmqTZXOwhYwr7e6+DbHOBdwCjPbZr0OmeH3h/ePS+K6GJQLTpdmm8Y/R6+8m18u9DFYoBTK7F5/xsjoKv147yYkhqtYAgkyZtvd+aw+WUatkAIwDRx+7QTlWsTRyNExeM1rqUOT960rgE6R+uOFpFsJusFeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203150; c=relaxed/simple;
	bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5C7uMm0youwIsJXWgiEWPVSCay250B7Ef7wyuBkERwOQeH60WE3LcYz7k4+iRogJkC+2Q+H/QuiOfR2MzCPzqeRYEXE9nr8+fakQg8IBsmWXy89bJiLhuT54U69DcKzzsxDJ7v56xjQ+mqO9fM48oA5h2oJgaQ7yiOfPYYlBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbvQA7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaE2N8JU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbvQA7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaE2N8JU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFSBr914032
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=; b=WhbvQA7k6MPbvR1H
	iTw0Z+Li9Y6zIe6AXh7cwGjYCQ2qej7Bg/ebIVGH8un+bcKP/qzq3sdF/hKWiEYa
	XTGunCpVZy651e/3Nmb2ML7FAGWtcIB+7IVPw4Sv3t9y1sRw4fYV9rXNDA2VNm6g
	YK+g1IZYP+XGvkhNCH2R8j+LOl7jC7+fWkGfjUs7vV32ZsM/vBt3AZLZLnmsJRNP
	j63DCr7zK12PmSYbn0IypozRW9pPOKFqTdngQQwOSWJs2GACr0yKhOWqlo75P1it
	itpWQO6HltJT+wkYENCIxnF0xeRYuNYmmBTAn6hWpM1PfV9yyEaUEx3jcza/8zvP
	IdPYYw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkp2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:25:47 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-82322894f5aso4338034a34.1
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203147; x=1791807947; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=AaE2N8JUMtzk1wqydtxYmErYpO7S/MBhf/GAH18cOUzw5ohOt5+z4JYsV/GE02192t
         P/zxbEiOjsGgwnNpq6MEXs0V2PClTJuPCShRBVkZPZlaUQfK0xEkoCp4dhLasbLbB0AJ
         9bhGACBrkrwmrf8z7pXVLco8F0Wod3ynyMT3tnOz8MhR7yD57volm9k2BEK5rRCF2Ukw
         IvRvgW783CnR/7AoVStGXI7GR3w7BFnLPxa8b/hBdDu+SXP/r9jl5zG/5fvv3JFNh9lN
         EkW9dX/DHw9OxQMnwUIEUmu+Nx3D792eoyqJI4t1qlffnhWzeWTCG4FzbN91MoFh2d6y
         Z4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203147; x=1791807947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=fjCeyPqMXzrjFWnZHShmJn0s8hbY/3f5pxavJeV2zaWFjfC8KLDyyuvWKVIEfiFXq3
         fVqo/XQRGMFX8iBZ7I+H60lwmtCVL5hVxY/XRF5eirr2xAePUjnBye5PNLn6Izs+E0N3
         LKbTG7e6iEtIUvfAzF2a7GyaUKVGuIcXeNAF2euhYokzLJ3Q2Cc5tnD9wp9AZP4Tci3c
         R7R6ROESEIXLd4jDYIrD69vXApFnwOXk9vNdhsbyS0+NJ/tWsjVKxUMlM8gCX7J5feOR
         SDbR1qNXXjBoPuWFczm2yZ27UBVeuAG/6UUVfYZcvmqEx9VNVdcTsRHuaCy/HP0PXYnb
         /83w==
X-Forwarded-Encrypted: i=1; AKwUvByujRI23COQBf7jM7Q4pw7viYb5Kw3/sSORF1jjTRToB3rjm9zPZOqkBiPvbhJZcONqm5k=@lists.linux.dev
X-Gm-Message-State: AFuF++lSN442BEWScDaxPNtkEqU/fJMssttVCxySCS8c7GZYsSN9xYWs
	Zx5lE8JWIUpHoQ73y4MJBKv5LrhmqwW4eFrnZvjjB/uMpOA10W8uFfB4oSmihPi7I67NmqmgcLV
	F6V+96RGhoNB0/Vuhx7n3lID/aSO7C7d2NQpxyFOE7+VKPBxTJ0UalMM=
X-Gm-Gg: AYBFou1cGpuZFjzXHVPcBhGUakqTjvOg7WENrzMCJogppzT0kam7CsWMldrYg4Ui8a7
	jM1AngSdCnHEpE7GJSK/cJ2yZ01GWT4ZUM5QpiLt2RqdlI+5sl10wJLhkinRE6lB8gB421zq48b
	rWFbd6b28vA/xQnvOZRhn5YDsuIW2PnFo71leaNuSM6U9VD4EoSv6z3WVC7KWSgQQz69c2SegSo
	6M9lZIJKsoarAEr4/nq7484TB/OiGUjAdZK1qqpf6wLg8nf7uUGx47yiRwo1fg0WuQ4LIlH/dik
	u9F3FsgBJz0mxz0eGHgP/G5mGfV+R+ytJXJn7UwKgQM7kmG9hNjkLEbhdCHrdEnoyEX9LQ1dBmw
	sS1pYsDRFIc95Bsq1KgI+poFicJIQN+IRFw==
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685964a34.0.1791203146829;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685950a34.0.1791203146398;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:10 +0530
Subject: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1199;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
 b=2YmvEU04ZjJsOIe7WGR/kTsTv42jYKJlGrvC3JtJUxoGdnXBz8gCE1n1MBhRmG+M+ECTXHo/Z
 pMXGg9n45SEAI3uBuJ265mAcdNWfIkl0nL2D0C1+cy2LRvedZ734RQ/
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: ynjpSH-2dSY9VvglykYJvbk2VFUr0CeC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX5zASLahQ0ggU
 /tuiGLCcmxLlutsaZlzKqsSF/XiZr9DR+ODLFD0OuwJQZ/pN5iASThLujFzh9ZF9usd9NjpVyKf
 wBm6D9gg88dVYQM7DHFbMfwIF4ZpCYE=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3974b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: ynjpSH-2dSY9VvglykYJvbk2VFUr0CeC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/nuURa5E/Ojn
 5YLUUUYd/HQRR/4QXNbplWRaemvTbhEs7MYiEZAX2m6HfJtsBELsdRSLx8vEssBNtXWKFfV2Ag8
 2BlarActqnYIrSCgiQAnGQZYCkI/3ENhR0lATUwhji69SAF0DLr3ekjCPa0JHjB5Nftcq60QVWK
 JMiIY14BztNHcgIXnAt6DBoGZbZpjEU3hdzl1Xeg6whLDVAMX6Hxq0s8VfW5qMW6y5tqL4rTKZS
 u2JAmECH2AnDrrNLzt5ux/dJ+NLqH/faIm3zABKby0MUzembjpMN0j4+Bm6Jbkl08u7FGvG8cAB
 AgxpLDq44KbilboND8pBVWSqlEXff+FJB0qD8ckmlM1W4ui+ruHWskA3XArolZpzP6k5o+cLLdj
 8DEecDpvGpi6m/kpZJLNq0bUtlD7hwSrsxfk5T7oFsn37HLTfNWHrG8bKRg/1j05pcFWqJmmj+2
 ocl9lwLDppjNkw9ed8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

