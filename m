Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC582D8379
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203117; cv=none; b=L8brg/Vj8ABY3EPhlox9I8Bj4rLzfmt0b4pDYbdC5ZJHIwjKLCh8rUOG9Jrv8lclEaMBz7emZQmoHsv8S/dSVi4f/4tpTdrS5+rw7GY4rxetiuF3khJlAN1BUj4MTVzCpIkXY8+O4U1Kkc8YkJX0iGRVVVmqt+2QMlAU6q4WTd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203117; c=relaxed/simple;
	bh=HKyqwTUYTExMJhmb1+RP4eW5jgd4a5EGVzR+sCfaZAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3der8JsGNA2t/cLdH4LImYpKAioqUuZmuOY9k/RLbZ/YtriuuiRjG71kRVfzsL6LML25F7sVjlSb4Fl/lwv6qylPQZ52XWGF8RjlVcPoMfvWfQuxp+fKw5Gu3FZGnVV0AuKNqesVf9FHdnG7jbK5ydulzdQEZp4aJVeTjyqMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSHRR5Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyjNSfLG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSHRR5Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyjNSfLG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFNfk1527657
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=; b=WSHRR5WyGVM/02jv
	D+7OKhUrpytHOPGM25We0HWsnQ+1JXi5Txk5ggn0l8+iz8EtlcsPE1GeacpcS4jA
	Et2dreGyPozErH0FajkxLm+2oIqnEmzb2hreTFbgnPWmO8PtmDndL1nrnWpWq5jS
	U9VFvqyXZkMFljeTapEvd5A9yOhQsRWyp5CzCjdsdzNWVDOd1G6dCq5v0vizd5AT
	REj6gIYvGXEDG7Vrr1I1++ZWZC5R+fxELIuUSUiVtVQU0SCfy1zKss95/LwF/TK6
	uJidpBpL8UPCC9F1B/hF61L3wgXzZqWB03rq/W+2/oD2KOSLAsGxLfJvoHpxygX9
	cKDaXw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dradk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:25:14 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6e1fc036608so1006695eaf.0
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203113; x=1791807913; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=;
        b=ZyjNSfLG3QCwhhwUVeOUcqNzuQvhTMgQiJjJerD5HXwfIXzgPBiegm3wy+lacVm1JN
         spNi3R8/aVANhaauaCfy9tzWR4uV+1MX8L2j3uRh2bg1sFwpdiFMMhIdY3nJal9rBZ+J
         xJ9EMlDp5OUVRmaLH5IH/OqJCPUlTforXA74SbCaAf0vzfx9OOYgFEVtkfIWlrrsMRYQ
         zeOu7iCp6DOM01FG+dJqd3un6D6AczHr9qz3HDv6LIZDmLRKtUPr+yBtcYkWFVfVx3tI
         kSJ0atYhA+5KPEJRbLp2j6gHAdMI9xMpMTNSnatO7DGMUhIRl04dT7DytL2p/4HlUrJE
         jlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203113; x=1791807913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=;
        b=ejnVg3uOcBBk3ycOolnjCyPZaeJofv7sW3DZ1HlCZX1jPHJ9VToHe0RZ9cPWLUojzR
         YHuU/xWV8HDLIv6jwj1fpIpr9X8NBO7z+OY0+nxK5h4u3NNglXUIO/eUFK7fvuXtOoT2
         8gX9tToq9ZxIAC/WgS6Wfd1h/7rhar3RHSoDcSxUBCAW+gTWKLX9D2LegkYrHr8gTYy1
         FpyFhNnfE2EWiTQeA7XwFOkJD/7FpiyErsozKJHtWkE0bWoxrHvpChNq9k7tsjjUZf4+
         rqjtvY86s/bNZlSh744eyCZEQCHBitIs01QmmOm6FnvHHpcWZf3VdpnOs4a6hw0LafuC
         K7Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzVxfExulZoaKOU6NTLTiybe6R9MEiazzmvmKiN4xfWWso6fwp9jMCHm/oHHbxBD9M71so=@lists.linux.dev
X-Gm-Message-State: AFuF++k6oKuUEYfz0/Fz9bAlJQgUBxHeZudz/f+laCe799ShwnBFrg3j
	nIPy5wPRm8J+jm37M8ja0nUoEIFnjWp9JBmFNHPNH358D4ZBYuHxNYKV3SsvO7iU+7EScvTrSCO
	nMy1tOvtFSqE4yrAiGHbABS/Locbn4MGvpkKI14dxgtjFi+uLtaXYlLA=
X-Gm-Gg: AYBFou11o7JdOXFDInRi5oX9+Fi8nIY4XwylB/9QX65WT8XNRTn9YlExUjPOUSc02Ho
	pJg7rpz0pmQF+9OWIBRoTnUIjr/TQtMQZzL/tPW3RMa7M0n/YkdnuHuIhFY7x+oG5Q4rOmjj/RY
	5xvC2zTJKFTOLPronPvS5B6kN07Miireg2wFFy5uaA4GW7BZNr8QR1gjsZ15HAfP6HNnhk+BtQj
	OrwNZiompQQUtizx3/lYUmvfcygVgwev5RRR4C76ceP9zqZR+Sv54phaFbiotL8xj9vSjdCEn0Z
	7d8icWGfwEJN8j/1gRC9biW27oVBNKAaNCjcgzXs7B5VWmJec9sK1NFARL0gUlSFEqb2/zE7FSn
	dyqb/gKUQBcchwE8e0mw0UqYHtV7ANuBd3w==
X-Received: by 2002:a05:6820:81d8:b0:6dc:beeb:34bb with SMTP id 006d021491bc7-6df35e2d88emr8799360eaf.84.1791203113606;
        Mon, 05 Oct 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:a05:6820:81d8:b0:6dc:beeb:34bb with SMTP id 006d021491bc7-6df35e2d88emr8799333eaf.84.1791203113089;
        Mon, 05 Oct 2026 05:25:13 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:05 +0530
Subject: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1196;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=HKyqwTUYTExMJhmb1+RP4eW5jgd4a5EGVzR+sCfaZAs=;
 b=5HSQzgqUR4kSrS3ESJ/jApz0unKlc2PE0bH2wC6xqh12aE4FFMmz+UJx3J3MQ6MoV2dHLRxy6
 zz8vcraCfp3DVDVCg1Tx9PsXWbwGPS6mFvDfMvonDm2QOpe1Azw1GUE
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX0YvwSZpQE8SK
 q2EnG7JR/QmCc+J+j3HeSZbRw/+3FqrH/JFw/NgSYmb8H4CfeaUE03ZzkwwTpAfidGVUsxsEXwx
 q5GHJaqusBLOTpwHjk+2AoFoVb7FYjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXzg33OOSiVdYW
 wBKy7/g19xu5IfhuVO33ZrUNhSXvXVYz1EwRn2kbHBSO4FcPYyUBoCL1eVd5KWB9UJdnbmqhhlY
 OQl573gg0m1Wt8FyDgrbYvUZjuTXfVHfTFDdaqKJLkQEpqWhE2MZKujf8SxrCOaRdhRwP5nzmre
 GGixXX4zkVGhRZS5AyYcG6phO0ucaZSs3+zyE8bIK7XVoc+sNHqjpxchOQ/5/g4t3U2HQvqPmVH
 tQPp1vMQS/BRyEwX7Yoj0bXUYhoI+luwsR0QIEexj7h2hTJd7cPCBsD4uTAtHj7MiG4mXYvzaq9
 xNA1mbo8Nue9bnA6vZO2aiC3mPk9+D+bkhDo0g8Bw3zbmhEijtr7EN2FCgsP18zidXNdVDaGCpT
 /rYvjtX3Dy3CV8Y7yu/WmhHj52fgrGaPXcWijZEzk30neBute+U/dGUmdWAS+v6hK3o3P0x0xxY
 IH3NqzRinFIrLfJ/5HA==
X-Proofpoint-GUID: n042nLi4MC1lbo5tRtIi8P7_IAQoHuwq
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac3972a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: n042nLi4MC1lbo5tRtIi8P7_IAQoHuwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

