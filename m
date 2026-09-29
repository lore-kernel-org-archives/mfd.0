Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDF65012B9
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687456; cv=none; b=pZtjJUdCr3Kt7oEtK0dr/tlEjRpDW8dDv6W9jJ7LlLL9Fdt5qqurlgLuW4r5UChvlbwLNM8NfmprsMm81gXS5MdlZCCs/w/yZX5CLK1PPlaAfFzucNnx7TG+r5Ia3e1gCLr1qtidcZqkoORxog+hZ/X6IQZJhgo0jz27x66Ttm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687456; c=relaxed/simple;
	bh=EynXBYv7jm6IhGXsx+LGDH4y4B7iCFwW4RuCBSpWjto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugKqg5QDz8F2E3p7fnkuSH6CAiarRf12X5Zt1QkmZoufQYex0ManmE467tBpAI9Mo9PDgv8foSIzSifttOkiWsdPb3N2JW9oH8Z2zy8TSo02gOsnwdJEuTKURncH0lELtHbniAId4j7HmwR3b1G2bNXpSENWqu6Ou51BGw9uN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyFn949J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNcUnhed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyFn949J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNcUnhed"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeYN613399
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=; b=ZyFn949J8H2wK35J
	U0EQuF7iIxVy1nc5gCGsvfTfZILpNhX86czvaTMghi8RxaIJgyiJTK/+xhxzNdOv
	Y7xyEInQNDkPsMIwsvGvoxi6mziPTGY3LBGYwFfFAKzbC9OArIpWCqf27sV0LH2q
	WV5m1saUL8wcgpjwyW+tkrHK4n5+OUWFobP/WjhoIFvNT6Nsobx+oAoQ7EaoB+Xl
	wLHqRgUgdqW1BFYbtP/e0kRBllmV92ECR2Jn6Pcjqy/V8e0UfxBVsN9U8VKzo4FF
	kIKoZWFA/UblD3fwV+KGjWtYPE7+e8Wdudt2F6C+CSQoRrjs1LBsz6ec3fbEm8MZ
	Xx62ow==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2kpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:53 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66988049306so4778044d50.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687452; x=1791292252; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=;
        b=CNcUnhedCDyjX25KGjZ4d6g5CgQENffWINs3R+PpOVHHbawye8HwY70SDMgEYZ4VLY
         nrbzjentyI9Sjeqn74eUg/lAp6t02IUln1YjVWXzKa77q2iykbfNCwtUpKw3PTCyN00s
         R/y6d1Y/jMgfND7qdoXEx8F4lCScaTDBG8SC/WDK2RQpgHk2Kuzm+gbimp7pjuFcHM85
         Nuu0vY+5KdVNvyRwryRB9M78Bx16hI3jODBb4j2jgbhpx9ABcgD6CSEumqTFcIxbw4mL
         KHg+tCNBtZWkqAE9ryA5S6Qd/E2HurLA4nr6rGL42UWhBxFR7awJ7uusHqGXS5Mx4sy5
         hBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687452; x=1791292252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=;
        b=ih/lspcbtCpyyoMoeKoEFZtntEKDJZLkH7t2PrJUpC/R9LuDUPS34ExnN+B4IkvpKO
         bmjZTk171fJjg2JJARqkO3j7YbfMg6G2j2oVAqWhz5HtGgHuTTP725TVKwYZPrPcI6eg
         xfolAIfmSoEWqbrwHdYRr2XISmBE7FRVZMi9xJftl6GyzXDBJ6ky+Xd2cUhYiSDiY/eb
         p46X39nZLDj16Kt+HMQL/bNq3gCxusPkqMmTg3O6Q9r8cbuC45/rh6Cz5yA5dgeBzkPf
         0tFu6mvpXq2lhAYZW3mpWP8eVWdkqijy736tI/M47rsoamjLW7NG7IDbkf2EjE8Ia/rM
         8Xzg==
X-Forwarded-Encrypted: i=1; AKwUvBzDPjNHbN1NYEutE6HL9aH6dbsM3wiygnBPmXj9DdVtUgSJtwCD2XuqFbpCIOut758GiHQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKtNQ0xrvcWsQCbbWfz/va0EZ+xXwEENROQtHzbUIF2QDjsNXXp
	NRfw3PBmqS8cGqI0yoqrPbwJBau4WTylYtsJtZnrz2iKh2yQJA173gD9+Jgxg+IT0lRrwXK/dp5
	C/3wgUaqPCSVZT1cCXCzOHpeBo0eJnU8hseFUXmdy/0D/u5jEH2OOlAo=
X-Gm-Gg: AYBFou1+FALjFf0eAwzDq8TBv80QabT0/l7KfT79BfsMNjlQFEb0wJ/rzqPH+KUXA/u
	RljEkbbEIZWsWIVQmcTbISCbwLX4wdXIt/8r+AVf1jyC22nLJ08M6PzCawLF7yEZXzOZTIG83Ba
	Bnf0muymMOtwMpn4DpX+iRr3QEpSX/mr28WiTCoK16OPSv6k0BxVVESBPag6bA1iB7q1JLRW766
	QBn4bmrBbbGCd6WIHWnmeiAMmjggsFs+EEy7SOhpmvlDTNkKNZZLSPR26D96nygUcp8ShLIdxBB
	mE5CrNaYXsQ59creM+MBZICekCBQmJuGIfZxg9GrRLFIVE3cD7KIuKl9XgyZUNVv7fZQ38ZlZSK
	f0nD0LJ24PAsQsOEgggn5JSRb0O8iToiguFQ=
X-Received: by 2002:a05:690e:1247:b0:675:6bb2:cca2 with SMTP id 956f58d0204a3-6756bb2fb4cmr349403d50.104.1790687452419;
        Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
X-Received: by 2002:a05:690e:1247:b0:675:6bb2:cca2 with SMTP id 956f58d0204a3-6756bb2fb4cmr349357d50.104.1790687451753;
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:41 +0530
Subject: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1146;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=EynXBYv7jm6IhGXsx+LGDH4y4B7iCFwW4RuCBSpWjto=;
 b=dj34oe+T09Fa7ErZKy/lGsEr8Pll3n76AGjBp+zp9lrbHKJrNgnEKsUl6BLy7U32S6eVmW95I
 51TZNkbrw9gCGrIBYwEo65x/y6tbCT9Y3LnivZh1rOUiNPpW2yLXFjZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX6C8GzsLZ4ohj
 hcbr2H87lYrq8LLx5mie5dN27nK1t3NPKJEDnWH07L/jmxQ8gXEcxhJCAUeGsCX6NRpgneMvP95
 b0BL8r1D36f4zoC5nMfqPP4r8PX671s=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbb8dd cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9kbGTm5rUNGD
 JjhzCQcZFRZg890PcRR9s4KUL5VVAfmMd8GYxLP5zDmZFI49TQe4+jd7e4Uwee/v7esg1D3dKbk
 d+iWgPJfJlDFt978L3y2wqzrR2kSzXuu6dbhVyHrdxrziQHChbdO7GzBYO57c/OndDd60YK7w3i
 Y3sABZU8E/icVetIX25likNJuycLWRBJP+WDOs7KCplKxIQIQUUmmHlneQeIHBYfK3NNnx7lVRJ
 8/IM7jfOy3LUe6YXyUUUf5JN5cU7rTe4+/1wPWWDDPAgNs974A+3O6gJ7arJuikdFDkyxDpSpGH
 47YiNO3nkxbezx1wZS6gLzAO0vp8xaJDT/eCx0x/0ojWs5/c3eVLCwqFWMFkdLdvJJeD0o7jUVd
 vJ33RTeQxddEVlJi5FZREpIiwAkDJBMmmgWQvodTCZhWl09gAoyqU/ZcWu+LMBYmZmc9sSHeP+Y
 4X4Y9HoCnNOr+vbeErg==
X-Proofpoint-GUID: Ne1mkgUPcGDwVrFsCNHS1NKDZucUfeaL
X-Proofpoint-ORIG-GUID: Ne1mkgUPcGDwVrFsCNHS1NKDZucUfeaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

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

