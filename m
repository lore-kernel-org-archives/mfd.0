Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467359;
	b=l2RwyYYTAtcYqrpN97S4+15Hx919rWQr0bvyMkKlQq4gAohPyWreReXYYFmZT59E4Z4x
	 w5Baacyku36K+2948xojE3I0djtBF39CSd7F+EbywpcgDHOYDlPqNiS+EWUjuGiwVCHSI
	 FG8wN9hvkRERerXHSBhszInxU6jBRHOV1BRXH30RbCft1R7dPZu/sm0Olq4qfZImxIz4B
	 QLirXotwDajEbz3tqArGuNedHsJvjctykW0nZ3etSMpCVLZ+oMIz/bWMgS3icI0x79vZ6
	 X2MeP/uAd/Riq2/387F0UPeoSMCG+6iPAbCon958z1yuZ3N3aPdRLxinUdS7ljZzdgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
	b=qgErLJfmlhEMyKyw4QEj8F6tQWIXc/SN2/3c4+o4FmeHmgn14eJVoM+eM2Co+qFtdWNH
	 +wbU4Fw17oyXmM8nluJguLp0YN9tnsEVbATRdnfM3Njujn+XJHeIs2JEtpeXVzkzBxWyS
	 jTMH5A3ACDdKvPcMsTy9RWBvukwREavA9B3Yp2cth/n++PdX7rSwiAfedowWllj4OhZHK
	 2gY9Z+5Ohb4gT06b3Q0Swv9pmR8T7h8fAEkMFqIuPfxag/zAYMyryOaK/N/RfKW4EW6zU
	 ZVsDxMVkmqpIjRit3KxMnFnMGfnwiqdp7r+br5nZP+IaXjF9k3ggXORdFpzCurOIOMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcVfdiCn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43E606A321
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B43E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcVfdiCn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuaq62973608
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=; b=Fx1YEHePkEIEbEYW
	DhVG9OabOyItaKaqLpwpyI4QA/LS+r/OrKMZgfdc4s/lr6s6EwLJPK60p7kkpryd
	WANzPuSP9hqabKBLljK4ssJXXQHaybm1EiEo9QMshW2DzsKe4qZ7PnBSAa2OQkgO
	yCr0PLdvqy5HR89EB8+Ox8UG2MLfsnwyFNhfSy83Iil6GjH3R6ZZQm5CzRiwOFiO
	kYv8Kt9E675aXNprt1l81qcCAeBy/YBJMqeBdpXU2r065eyDJdu70OTXJVESlWl9
	l0CKzKthG9HGgGxzuhx53iJSBiiQQcMQDBDq4hPNVhIbmdj9W+AhhcnyJp20RKJY
	pST2xg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03fbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso6712816eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467357; x=1796072157; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=DcVfdiCnWEQXD5uKsFr9B+mi5D15ydH11DZyicCRutGQVyNFIS8+cKyn64GheaU9vL
         bvSSAQWm8WcktPJcfubCGdgoymahhFVebtfGYxL4lJKytPIBuL2qWhcMRkkJ4i1YH6St
         BRT1i6jwWoo0hoYsmaqe7ceq5DNxYwtTm5BhWUF1zZpqoIufa7kvSm3jnNqqrUfj20+O
         LCCdLoSwMn4JujxCgAFjnRlWZd0mNbPUJWiSQNfoNzXZPGvEgq6eQF4UseFYC19Xneyj
         wzU7OxyggaEIilNVyDtQV4sF0Rm0+Z34fs/9bNgUEmUr4iOhKMP9Ctvwq7cIkq8V5MNM
         mFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467357; x=1796072157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=aqwb+5SUZFkTYUsm3b8CWQBDBr82pcjac9IN3Ea9KLk0dM1gBjcl2STYBP5GHeIBmR
         yhRfV3634oPC7IbPLfFW2igGjBSFFTbHGmt9lPz546bsHQbsTfWXNat8ilwsVjZLUPmg
         8BjMYBSBES4vDRg32oUSxfsxutIx4oeQd14J1N4tofDvfx6se1qNQfvnRDmwvW7HVpNK
         iKrtEKTr32NfIaJXC1metCaGr0mv8L4xzncGmvnhPE28DZyxcurT1cV/+ZHfXijhxtCR
         esR6KO72MKz1x4ijxuU4O34tQeT/apf7hURIyUR9f12HnGJSYO7tGdvgfii3dx8CTbu1
         77zQ==
X-Forwarded-Encrypted: i=1; AL+hErFJ8ZKxeFHmf9mQd9+hXNYGvODiTVLcr+Zsm7I827LblDS5Gd1BcE4tG0DN90fL7kfk4QA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9cU/6sLyDrIfDZk9taQTYfWW9K2JK8xzJFk9zsj5G5zjUVvOzt
	w81NuF9i/cyPBY2zq2gXFfbb/tebKzXFwqwumcHVJh9FXYmyuwREzVIhQQW1U1cHEDrajeBXD8p
	T40EPF6rjI0s2WS82ziP6rb2OEhDRq7XFIeGX7ESLfrqHF6MWBnXU70Q=
X-Gm-Gg: AZFdTZcQgnT3xXdtE0A98F2ZJaKX2RVc2vkPKeeXwr/LzzNwUc2LkkYYgk/sSQUQq17
	Od2ZHdiHN7UGk9VWrjCnb2nbkLVWACvUhXuM8mNvS2OcQjklOkfU80HGkn649otr8jAtGhfUMJL
	yALw5kN1uDOAPK/yDKslqTSl7RcZqoa1MEWG6XW+rDyCFitcz35G4RT3smvPIQE/8kIunglrW6U
	fYCrCR1EsR0zNIMuXM1oVloquuUeS2aX7ydqKtbg3/mNNVihe+tJ+439WUHR/R27A9YQqdrOrsL
	lq/Xb+72Dz8BCyFzvw6r99liYoV7hs7lPcNCUqihLQpg7v9XzBgbqB9txWXiBVltKUsgNHTyE44
	e8KIGFgohmaDBko//UWy9Yv8U5f5uN4WzCEDZERJ480X4P2FwMWIIgoaanqFX0XbmyylwGR0rVz
	eQ9JtlIGHw
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805708eec.2.1795467357308;
        Mon, 23 Nov 2026 12:55:57 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805680eec.2.1795467356775;
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:48 +0530
Subject: [PATCH v5 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-8-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1250;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=p+DrbvohnZm70RkY44JTffgUjgoL+i7eEMdPZYxTZjA=;
 b=/V7wXZSXhkt0EpHZdk8xNOAG5ylHqm/2+sfQJBwLcAfPocvgsEIMFDithwf9rfQD/kDQHODQL
 b5oQJaQ2G7RCTZwrGScrPunlmiaQhmnr8+GWNz7DdAJeMCtTTR8zh8h
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX34T6YRJEAZ7N
 4KAglx7Hrr3k4OyrRc2JiCnlLi1sx/2OnKyTCaDT8anShcr3BIITJUpoauVlLh5RNuyKE//ZdxX
 RKNDVDDaYW07EnW8myzwYzc/yw/F4sfhyHU8oy65mmEfSDjPolPnLyi3MJka4bZs739QuhDctaq
 E/I1kNQxoDcdULqUk77ZB2w1oqhCxl9bxsaQghTkPCXZNPwhJYPVm9vgonlYXpDo2/DnMUtUH8i
 H5w5UB3H1h3SVxD7YdCDPCBiOvgzBxnRjXUM3+8fib34AkQoQ4WTZQGdBwgFcq+U1+JQSO2dHo0
 uehDWsq+kmYpcp8vLHcjTjWn/jsMeNxekUA8f3jaJWm5md+MNo0LCZTrwhp3FYRpxsw6oIzMz4f
 xi+7NhZt+PQ7WJE4BLpGYUvDOd0VOHb5H/iC2iwj0crXzJxC5nR74hXikh9TPpli7GnDrFqQUY+
 bo0cINNPHA8/EYaBCYA==
X-Proofpoint-ORIG-GUID: Uc0I6Z5kAfYPQTXeUR3jwtNdMkxklVGF
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04a85e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Uc0I6Z5kAfYPQTXeUR3jwtNdMkxklVGF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/u15YMyRIMgk
 DqPu1olG69pO4E//3uFJkpM5p3/oXN1q7KtRpvQzPFDZqTXvBqb1VweR9vtiV426aK7KSOmVvyb
 pqGgh5z/OYob6mXk8pktZrBpkI06LBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

