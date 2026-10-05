Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43548125E
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203169; cv=none; b=T7UjaSfaGf4ChJX4wMVCxzfg2qmYxVkF7XP5k1SA4sklFDxe78dcv/peMrIwdyvTLhcAJe7FybBWA6n121pX6kq/SmdPizn+9Ezn9iT496+4gezZvpViTm1+LRPlcd1MtwQWqPtLa0lhuKYQBp3gSnET0hN47hXf9EGIOWMcf4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203169; c=relaxed/simple;
	bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nd8pazzSgXzTYHn6hXa9xF05pStI5Mx3mrOHzihFUDMCtRyf7yKR2bTQGRbFRYf5c11u+yosTrA3CMg1MnnIYgxGrpmQsCDy4dwDBOWwiRQp9ZciCrlnRWgAuczJGkTbMGs0TsxCebLs4Kcs7pnd4UiBLWngDmeZK84GLkDFrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIrkrTfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+Jq2+Jq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIrkrTfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+Jq2+Jq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFaTM472534
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=RIrkrTfGelOYcksL
	6SSuD/FSnKgYiewUFba2LpasulhJ1iUH3GQZAGvZiq6iXoozINxLiHxR79Xnr7ga
	IMmhAuQnSK8qCTf31sYhPvJ8n7OhEK9YNUj1pWeI7rWbdy0Zky7S83Btlzwx8B/i
	g4MoH1bXMlRRxO1fT7SuulaTgAB7Li/JJ1mdaHtpOBOq4V1MYjkZXYXbsc6D4JUj
	TZgCrpmoIuEqhB7R7Hi4XHTT+VOj2sABmvymBfe3JfvAyWYxQR7Hr+G+3dRpKOB5
	W7MwCMHKFZXYki3dbt4BTaWWAzsCTZmDNMy6i3asToD7zih6+AFFrHhqQtQYiVzM
	xGtayA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvewneg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:26:06 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80621978fddso1292777a34.2
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203166; x=1791807966; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=c+Jq2+Jq3Q+PWQTZvZNhOErib/zcAtt/byyVdlkcwplzk8Fzg+KPZTpYQXNsRrKuMP
         qB4tiOP67oewr7UPiylpynMy3xR7JxG3lZoC4JaQ7WjtuBhgLWiG+DRtNe4yuWMX5FB9
         +8VD9Ok9oII9oQJAgxb74Vrw8be5t/NDyClNNCepL+qfIbzVua9TjjS+MLDyfrNFSlKM
         Gz6LIWRVsHCqwcgJ50GJu1XapTA+yKDfXWH3Uc4rvlGG7KY1qcOCiRoLsMicoN9Ufn/7
         cwH01NUdHqnfpzkUJvLiKl8HTITNL2trj3u8THtK05C2xYCf5vD1vTZEiK8nTzLeM7UD
         x2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203166; x=1791807966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=RSGB8LYX6h8XT8/iwK/83gZzyXhP9K/ZljcRAcJH9fNyS8eyhWJ3iBuwqs2417H8U6
         WHpkRBVncawmuiWbaJxAX7phiIQdMm3Zx5at/aXRt6r8nPA5iF+ACl/JZ6lyz8tW4J+F
         DFtswEuSMk9fWlgtZInVrx1gJ18K6C5jlk3aT7sqsA/Oo9xRjDhhdXNSbb9+Ek8OLjru
         UbHJvN4OeQxODBVzBBgFxAAgbxn/Omuxg7qh5R95CwoObGe/StqHEyYxrg/QmlvQFi8j
         1Pvbf2oCleu6+4e3XwbG3AmYaNRRHZzC9e18PORtt70dzRVctYcJ6jmv5oEdgjXm+8L8
         HQNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXNq85BZXYlvwJd54gr5dq/r9ruOnHqObAmnMMHmIIgkmSnLtajhg4inGWQ6JFmzpyyWE=@lists.linux.dev
X-Gm-Message-State: AFuF++kUrdppeC5BS9dEnC1FvdVGDJfM8EIl2OX0MGwR5A8WIGUUHFCS
	JvX6z5SoIGjRBnDlIbH4jH+cEp8Rco86FKnO4UVCwOx9uIZtKPvIgRVq/UFk5CM5sffQU22cUNy
	vTqcDV3Si2Map6rV4MKesSRfffnJ4W/hOMFiJhoG+gLUMVDwZvAcExQ4=
X-Gm-Gg: AYBFou2ZlK2fG00CEFGDYlJv4Iv9O8DfQeb/UUEhN8ITCOqq9F8AbzYh+5J3QUge/+1
	aue65RNVkF+bmQK8xJO32YKrs4OVW5fjocA9IltZIZaftA8r6zuTbuQk0neUWe8sd+4+LbRgibD
	dMtEl7LX6xsAflRzkQvJCjm1aEgtrSsCYrkWnzgZA52evZZJGTg0sYFh1HY316Vpv8XmWRLXcvF
	OA4reJeemsiulJvFawLYGOcYdvlF8L92r78nzeMLshhAzBrHURPPuOucD+NlOvlNeODZptRH156
	1o2y8t36ArEUWXLOM5G7sqXAtqXONKaXbEAOMYuCHBHtG1uf+AoFdmrqQDYfw5HadVMOvC6yGLB
	THJELSiv+BZYarQN2N6ZweTVEqFzcb8ogxA==
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11375641a34.0.1791203165920;
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11375611a34.0.1791203165396;
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:13 +0530
Subject: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=fvscyC5ovPVUh2ckA6Ul2zePjK5XpmEJH0PrT6/u/G8f+7JQFD3KrBjqFi7Abo9fV65erPpYq
 n3zJF2DyoGmAPoUsrwO7Hl4syaepNSkZbaEH4IdASnDYNJ+rObeIVns
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: vUeC8DYjkkjxbIxrVVV2aoTe9x9vgD8X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXzEJu9Vn+UO30
 GWyHSFSw6zeFWTlzhSXSmVo1hnzv9xcyKsQ00Ty6wmAKQ8fgT0g83ZeeGKq6+qWMQnuLn8D4e65
 9XWXy9vJRFuEfbyYZ9M/OnU6fsRqz/Q=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac3975e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2092mb7EFhM8
 sbl3ou1xxOVJe4Zq/hOusomSxy6pGK+XIWnxTZbqYCA7Q5wJGkPa9AHUUvMw6lln72r7ECVOf7a
 e/nfeyw1FLK8RfH81L5fh8JIJvwxDQpz0EspVotgoiMhUG2uymbiNiJZx8f9O8X9BYWk394nV5x
 S89o5A594FHwk0dM1Oq486l90DhMZ4Liqmiy0ACHNePRZ9pvbU+SK0X/ix9tg1UL14t+v/K0f2g
 fksSKW0gJs+kfVgO7wv+rKFd1GkpnWa6x7wA4662J/GWxtK7famyn3komlVNM92Ag8HfSGfF0/Q
 Ua7bXYFpwr+eo8n2sHp3Z7YZA+DTCOtTaJVrV9QaKghBynkP/oi8GrFOxNXABDxZuIBQyiKA0T0
 iWVnEvFzrCOn5fJx9e9QQQzOZheF4TQhAV794F5cw3WkKKuGo/WyLGRs1vn/dFWoRABsWMs8t38
 AbhJ8XB9jVO1ILs/StQ==
X-Proofpoint-GUID: vUeC8DYjkkjxbIxrVVV2aoTe9x9vgD8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

