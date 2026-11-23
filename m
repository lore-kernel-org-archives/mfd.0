Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467365;
	b=iMQZLdTgfGM5UQun22SDOx0Pjzli8cBIwTXliI5pQDL9MaScjj7CGiCMpVECxLruoE5K
	 RLsRbmKEgWbAkwg8zX/Q61XCAkgYxmof5v9QStcUU1jiizdy2GwRrBujqLjGJ/mgM9egy
	 0/1L/d5260ONhMPuVnnmVYeYGSu6bLfVyGQ1n5Y27b8424zB4Rd+CeGTNnWVZSIgSaBsM
	 5olErHzi9ST2GUgACKAIeIMrXlLQxiA70eLBJ+RTZdh1QeP+y2YmGO7/YeWkNOy3N/JXX
	 L6ENHonuuXIU0mcrVVoipxVCU3fV3QpeWTa0yJspeMRQVBY9A4NMoDv7Tq6brIqvUJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
	b=t9Iv0l5IqD4DN1yjAe4SYeeH+Nz3atJ28rIaSRiIWgmOJO7bBFAo8CDjNM6H2frbsVQb
	 aoTgY2Rq4CpeFFumVlBWWPY2T2PCqivPKtLlbYr+1Y+ei66Sn9MQepGrF5pyxUJk8IAn+
	 WgoZRbMu9xvvzSMn+vvDs5DEgRV3ze6ZJa+kyPnadhJvX60DNCO5IAAP9C2xosUtFVslC
	 3uxshg/M+luhwUUHnIjXMhGZEAfdvFCidYJ/4LWg/syMNa3fE5+rI/Egy4MI62PTD2Uow
	 kYJN/opw7PPf5w+wqo1nJ5IX+FgNirJeITtXqzRNUXUjlD0rwhvbn8yNeVE4Vu0T1aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OyEbUyU0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC11606A33D
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC11606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OyEbUyU0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuPvp2350002
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=; b=jSvXuoSOUp29r3YP
	UGRAlBHjsoytB7EKyciLou6y6Ceo1/+Vr6tOBvCHevzLQ1PYMCTqYotBKpz/hTXU
	mYpoceh776OjlZHBSmpiCxE0773FZS7pKC3c8cNPBP5fIBaMeEX9KGvp5VevBcf2
	Y/x1AyvfPZqBGS+VTHtSginFptiCkGyOeibs4hRRDuHpU8KzkqhzGl0Y7xN4J6t9
	jnYN9Y8Z0PlGpS/4E+SKkQ1QLLH8MVol1fY0s/ApF0zATZtWPt0KLHFmUbW6yvoR
	cSavC3wKzwPcKJwOwVdZ00SNAEbvhBZkcHz2ca+f7+We3st0L66nyhsCLBHmshNS
	l+ozgA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3cxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3871583c88.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467364; x=1796072164; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=OyEbUyU0TXacNBqJMf0l6x2zM2Ri2PJ3PMKSw7i3t4uAjcUbIrpZs6Kh19QX0VcwSw
         c4RmoBL1ldxyKoZLEWJ8u6JDa2lkq1rUc3SfE0ZztvE/y7UM/MQx84zckFnuKPUtlHZt
         e7CXZomVGFeoqNtll1m9v9upx+9Nd3V+xMW5PyEmELvSaX0xp6UkCo6gQgWp6PBAVmYd
         LL8hbyZvazUZuaIr7AU0ToKJJ/5q8n0R0OgiK/VuEkKKHaPvubVdCy7n6BnRegRiOFYc
         jSZzHMqnpXxXBneVPtcSUgYXgcZsSLX+q6JX5YXTb5n/Lb1XSmcQhwgNa/H2KuLWl6Mk
         QkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467364; x=1796072164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=jOrBMyej/hTlPLHAK77SeI4R6PKGe7WlFI1oa3Ut99RRXI0kVi60jMxnmdDN+2Fzn6
         LOx5qTEnpBFufD+bAyAHNh65q5IHg7MJpD9OezrVII7qu8PvHYk5KPTGwOIyrCTfXMY5
         ENNJT9mbiy53quwx1m/G0FP5Mg51y5ctLXFJvMchbgIOrta/i0PvTrFAWBwbwfW+/DZE
         sawo6nYJLky/T9d3tCkyON1yy6WLM3SzP0iaBroaeY9rTBGO/q4lkuyiKThiogirp7SU
         dw6n7elD3upHUtsxf6zw+oGbEW5QZz9DPvbbLN8xAOCdf2U5/cnjx5LpRzqyupT8/ym/
         Myhg==
X-Forwarded-Encrypted: i=1; AL+hErFaxsGA9OCE5MiB7VhLZsN6qQC74IhWqyrWZgsbTB9fpMQdGCMkAT/xaG9daJhUonFSNqU=@lists.linux.dev
X-Gm-Message-State: APuU4Z90HWCow7Mp7K0ilHqKXnQBqh/Gcpt2ePW6tUyEWQXz5DowgphJ
	NvrMBDqQkEWf8Jox3bEodW4U0ifDv9RXDDsx6thpuPuY1cI+t5r69XW203UdOxxuuKTFsFEX8/5
	jalWay2tWCxhd7S4B1EdkzvyzN2pJaB0DYxHopLskUBt0LhUyfrFlUdk=
X-Gm-Gg: AZFdTZdgFIHDkG71VcDHjLc0E/CHs1h7hAWx4hqOPeVIeWWxrOcLu4BLlJZUVKBiM8I
	vr6/0pwM/EODjjUO3t/xTmYwKnikHVpWyqcLjhpLcsXU0O9DCHRyj6bunf9y3irDSldOhRg5eqG
	84OiyOuD9nvMfYaN/6Tzsbqa4AZ9rG4vawEWTq1j++gijnSvRSP96VZUeS9Ts0NnyMgoxroVRoR
	+sHjjl4RaQA42hkiAYWJTx6VRkOagTyCA2sq9pbXVqNoz6WfcJQjuq88i86yjqQJx29wNJCturK
	RlzjIubxKAn6TdM5RwTuCRsQnSPI3hI0tco3m7civOnoDMKmBF1CIPICQFHKXWqvIEeyxsC9u9o
	omeyLzRxwghXZFtr/2vw17O+T7YXESACNl5QGPu1PiNi7XVxqeCtrTgNMxRjEC34ILgf0G9LOu1
	hVlirG4u0g
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463346c88.32.1795467363933;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463318c88.32.1795467363407;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:49 +0530
Subject: [PATCH v5 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-9-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1260;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=L6nSizHG/y+HmrSiyaptHCLW4K4aN1EFqVoX6vPricw=;
 b=WBO0DXaIYcrZfed6MtS/D0ti+xN8r+XNBuwf+df2d8oFiTs220C7lXXMY9zB482qMtmxdWwxd
 Snsqm69g5abDtBFFihGQduCh2F/DMNTqnj2OanknbZ+y+u2i4FRVODH
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9gzsZsk1ZbSx
 Zz+BNzmI+vEXBaQKhKyCK4SP291pztDmqlct5YFaAmWLMPIYotd/cN5scB2SPr5qmTt46CjYT7F
 J/Cxbu6NlxFz9sYGYwE0mQxXi8Z7Ui8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX2UV27GGS6h7U
 zO9H/lhddJBoKGt053UjLDpbU0EY6WMQBRxypnpmtYx/EyQmdTg9o3KqwPKIlMRMu85slHG999q
 Xd72r5GEvrpBOtEi6ZV1SP24VQih5YCJHAi42EHqJK1UnyOvpB1NEUo2EVt8j2vUJ72cKe4FhkM
 1GQisILWIBkgLHewZwdkgqiueIBG2yYpBuuo1MvcvUxXyp1YGo8tb3jnRbfPid5FO/i3VaGTSKS
 qBV2C49QKFHrCoKELDwoODX6v0b9mUXi43ZkTaTfW0FoPwUqhHF4qz7OKOByiaf1GWSYpP3jAqs
 b7dqKGR17keEoiDnobZYQkuJARK4qYr4r22A0VQcnBMFqOwnwFurIQQMSsuNAAii/VaI6UMuAbW
 eyyHZZRQFq1N0lzBQduqsyXTnlfkGYnEfI18n2HPZo70YPi6xTNgPL0D0kjUqolYpL+inr1vyPd
 kRtf3t89AcwOTXvZRBg==
X-Proofpoint-ORIG-GUID: 2YZ8WyY_GfKMC542_-9fCeQUWAri5jt1
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a864 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 2YZ8WyY_GfKMC542_-9fCeQUWAri5jt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

