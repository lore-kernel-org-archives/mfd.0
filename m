Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467334;
	b=5Gymihqsmsk8vknLoR80W3+l/r6JhR/rdbNhvPwld7S81wiW2uqrOgtr5Zau/iLYMtlG
	 oKIrj5U5tVE2aLRy+1qTucmq9GW3HJjXtPJcIGm9hF5PciIoDElZI6AadmGnguNKqbbZ0
	 AzsL2e4uhgP1l9U2yBdUxjR364dG1GxmaQEEEotlqmbyvddc2oW4xpd9pRec8qGLoo93h
	 CYXT/CWylhkU9nu1179OBFJIiyse2FehkxGkfhN9CQDAiI3x57LxpyduafjEoOYcZEkay
	 Gkz+yGdcYKZhfAJniITx5lmtH6MplNBN8Kksnt5r7E6wEET86Js4hmSbfnRt4IhgMQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
	b=JvPb1OLbGSVq9BqhWlNMIgZ1JXubecRX7A4fQUQQk48vQ1YelxCN9UweGk3TVd1+4HXQ
	 AeFHvBGLeZ5Mq63+jGk/X5sg+XfzqbPHCwvoPHCVxh52NKm2+0uffswS5NYqD8yVpmcL0
	 Y/jVdIsYwBc2Kv0CB2Dr8XQW9o0QYRiJIbcaV6b2/jS9JnzbJAPmDGm/kFyVSb1qr5fHd
	 1DwZPpIghKOw6FBmfJmg+OBlADH12wCLMKxR1tGruCwzrmG+xcgBqe1759TjNU99gz7xL
	 M7+M7wekHj/IFXinM8+/0zAY+L6EG9enkzOiqPyO9s+p8UrtFtP9BaLLvFf385helUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROtIVlR4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B9606A31E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROtIVlR4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuhgT3962814
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=; b=mXyHqxhykrXmbbOB
	c+/PPeNUMQG2nQEliqU0Pnu5RqWuUV94jqtt3QfWwnKXO/dpntDJd7krxOIRl6Nh
	z9qYu1Zxp0ywgewuQIWQA5F0C6c9D/aBiXmCU8u3QvR/8tXJaS00lJuMcuFarAw4
	kKv068ordsY4dJRw3ydqEUoYP9O0JhINf2dFmLwJ4DL/TCztXZsfknmW3zRM7ohY
	hfLxi19sVWdTbAiLkXDLvcgrvbQcHxlJVxgCJxIXLaZJ7cAF/rVc1f5Kc0F/s8qT
	zj2Qd9keuj4zjF7jmthhhtVeQLLLhFGE3srkWF1jVwidaw9DOgoMnoq9PQzUx3d/
	WAYhTw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7u33e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so283376eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467332; x=1796072132; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=ROtIVlR4AzYmUYMCsUT2I7JVA/4EvSWE3p39jBVlQSYlarqZMgaS0Wax9EGW/q+VVe
         Q98Cxxhq2sXBk9oV0t8Me1/T12f/u+Kc3fs3CPV6deQO6/uChxd5oqN1oHpNPSAWeTGe
         YZ+/NZjDdHHxOegBW7v2tqrR0k/L/I97OBwQl3rAmGlGQ232i8vHdaxOdVXF/E3SU37J
         21QXnZR6mJaJihiNTFO2bB0yW0hra7xUfRhZfL5q1DONEGNf+NumoY1IYUkYErerPreF
         e5zQlZQ/+QpiKeF2gdPEYKNNSvSRG89XVI7cvY9nvBB0q8DUYLnWT2BDnVT4/TKzNhEx
         OeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467332; x=1796072132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=n+0bmS8+HeYKXWXeZWlXN61EISJ5S75xQO//H1DM9TwugavGhBOer40EokjP0SDnk0
         5Zf0zaRr5MOsSstNqWDjeJ2KErI9dK+wZ2EkHUC4QsOE3OO3XrRcYiCRA1Jucywn6izV
         yCnENpZXSKQuYMAgmDzj3Olw4eraGkwBPGjwnpvR2vjRduYYsoEgXKTg1XaFYdCDry6m
         9KgqYA+y6WRJmcG5W0KeAOhNxYfTaxUgNkZWFsRjoB5jodt2hwh3o6HiJLiK5VtiH6Vb
         ptAcv+LHl0VC6DgqgkE1Se2o0KaZmF6HHG68cHyG5PMGnxfFTr8tVo37XcxzM/9OoYYu
         SPBQ==
X-Forwarded-Encrypted: i=1; AL+hErGAsz/MSZukZGwsXPU8HYkeUFM8dPyCyih0E4BNRFZLiXYxztRMeRfgNwyK4ItS+WfqjmA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Pnj7r/ILdBo2gSMJoVY57S5ozVrx3pa2+dr7w3RGwbKBtPA0n
	n1v7yYWGR+2WDpGhKLA35TrFiDPwF9lgIVCY7RBpfj3vam3yFfgx/WtyEp30nkWsjcNgX8iSxqz
	TyLZuDi0p2CHzqrixfnuI9PQMK5DkD1qhVIY7wypjIdCovNJ5qFLFuiI=
X-Gm-Gg: AZFdTZe3brUugcmpnRHQRsq1vrFZSkGw2VARk8JJyW3WyN85TRGPwlwZcxb5MwsZ3mB
	HAwgI2UaOZrtMXF8/l/TX2cj+aa1Z2FzRs5jBsQIwxrO/ihzHMVEWbwAwL5tEy+9DZqdqj/piji
	dLJWa1DokivhnKoopQ8KM630FkvLOCITCCzvOX2k8QL3THZK02tlQMepOGJyH71xLd2ZlLHdtHC
	9fzdfKdd9py63kW9rXe7iBjbwPQObiFMPoxjqbdp7xKHC3EK4r3SESIFalBIaMKpSPb4vIzl3Rr
	yEBcLFBFeevtvWhdCZd4zz97tmlFN8sV8NF/dmLA6gx1qf3uAsmJKZ0r3/pBDrDMb45r+/LOrUv
	z8vAWsWd3BdJ5AADqqIvvGSj5EHhGXxIKeO3uXLNILp217Xe0MDp+uU7Sm8Zq0INaiko+MxkaFd
	/ARb3jBcHc
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295207eec.16.1795467331488;
        Mon, 23 Nov 2026 12:55:31 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295136eec.16.1795467330810;
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:44 +0530
Subject: [PATCH v5 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-4-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1257;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4feVVnMM5ALc3+0FOkCxSTWjH8p033HoHYKJfJ9BPqE=;
 b=U4gJSJ7RC2dXsz6wOxP8adtXjI+Uqf0pB3DmbJF/K6HNUSlGrMCcyr1V+JIqX1azpuLpHkx59
 yfo5aLfJyi4D0Y66+UF37R5KpgJJGDmdkn41LputUlQxvgdm38TPc3X
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04a844 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX1w/+V9LHlyJW
 TQaevYIH1gZNfTELeJw7L+jBLCCLGcG6GGG7QbXzQ64u+Yn91M9oMxjZIJMcDel42DIIcqpQKR9
 HJ07XN08vtXy5Buxbglp64NbTFhjQsmS/AIx74W3Fjz66ZrVfMiQzGCREo13LjLeN7V9KNNY3PH
 nPInSQuM8QnnY2ajwqisMqeZ2Wqn/len0sIeRlKMPEkG95mMPZfLgG+MvqYXJjTn4bMbe0ulkFY
 sH6EWC+Je6yDU0gYpwpbN9GKoPkWCrkwjgvF6+MRtVuEw/h8dFod22GhoIDR67f9NWtztKu/CrL
 3PgBQeU5CeyqS4vLI/rRXVFMBBIvJ/Uk5kmeiCf+71mxebVk7wa8WWZs/NUylzFzTQ4aUKV/qyC
 mhoVdx2R13umsEo5qkJ0gckl34TneFQzH10RGF40ATOwoy5TftrN7Ey7dzhKwBnrKeMwjqGfKhR
 rZOi1L8KwXjNKmwOEbg==
X-Proofpoint-GUID: 8eshsoiloNORAoL2ju6NlnUOa6Ik-8FG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXw5broFxHufCt
 m+/HBUBZPpvUetFyk+80HS5iqqUrr5TbwgiwcaWrJMFgb69jL6sEZkYNXVdh42wUlVwc2jfgu5f
 e9C1rvIoPlB3NdKxLRbwFVFHS8SNV+M=
X-Proofpoint-ORIG-GUID: 8eshsoiloNORAoL2ju6NlnUOa6Ik-8FG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..76d0481914e4 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,17 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

