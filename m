Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689E4DD3BC
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772388; cv=none; b=LkQaFSmkIHyEyj6vfeyIT7PxRfDlDwwPqTIVHtozK0DxY1I4X3HYaTVbY7Giq09fp3RCDLENwLVd3VMiczML06cTAUK0G/8mZnLo/dDV43mYcYPbXaAmbCYoVMAX32x54iFiO9CfU8bd3DK5whlo4B9BPXuxPZZge2r2EltvWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772388; c=relaxed/simple;
	bh=yMrVgy5Kni3LSHIQ24kPZYlxQLVU8MMQNOYYa93+1go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3B5VQIRMo4trbniFJoSR+ja8IFNBAV8EncLwNNmvZSp7zgFO20w0OotXhgkA5r+zS4VjsQy18JBn7FUAe1L5WjhEhdCKdAEPnEeGuUJyVt4qXOGStXpzTBo9SXQBxIghchvwWxLZTI491ulVzy3WcsFoEeA7mAntQjg44B3ARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQ5uAfJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYhtwwwW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQ5uAfJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYhtwwwW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7JR4225883
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uRpRcYJsQN/
	2DNtx4CpKGWOUgD+4vaWgWemNm1Au4DQ=; b=nQ5uAfJf8tdJCeahrNkrPABbI+f
	DJPpKzgqJxkr31yjkYVfUmvwg8HUJqaO8jRRkoikdZqa2UOlLsNmP+n9TMXfbvsT
	rHHw//foFiX+suUrMLJgW1eKXthdetqu2bMd9BkzzcUCgRz0IHxtPqdpn9gjX0z6
	hWEveXmywJV40k+HU0suqaweljCfEYSlbXSfoWfqa8gX8wrjPcKdN63v5GlINvYv
	aArowZ2grOVo1Kji1ueXErYkSpUR5ZIokqfTbrH5+ESQzWLv+7jjbO6W5kNNIQlP
	wxKX3eHjeNQkkcwhoV5ym9FfU8qrDQFqHgvvH1CYebCQ3FAwqf67Lhok8Lg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh80wnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98513b850f1so298594241.2
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772383; x=1791377183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRpRcYJsQN/2DNtx4CpKGWOUgD+4vaWgWemNm1Au4DQ=;
        b=XYhtwwwWEH39E1bQ1f4rQzQdqpp1bUBcw6BtK/QxIYQm0EY7D4Uzj2LDCrWNHqP6Bl
         HXQ9qQeiMuFAg/yhlXFcf0TiLhI3PVtUNO75DE8kTvdpWpwu0plDM1eRm77bsJlo8uqz
         WCbaWzjNOFij+GqP4XYeozEymTllqyyJ7puP99Hs0eky7hWXKl49ILybpniVcBF37doT
         C8I06L8TLXO+Zcad6HDAQ1aQZPaDS6rXP6sBZ4ye3P0Age7rr2718VeIs+IMRsHfWLKK
         3uXeulUUc3mTPe/d9zg4wH2KGGmJCibnGR4bOLaQ/L4xcrsPvjcecHWjP5LQBT3RFP1B
         vk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772383; x=1791377183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRpRcYJsQN/2DNtx4CpKGWOUgD+4vaWgWemNm1Au4DQ=;
        b=HAhY9f0Noqku1+PiPnBZUpdOHneILBJ6jVpBEVXog0tvOk5QBRokIOxY7FpMBR8xIv
         JFMaqJ2Cow5wl4f1Cx+S72iL3zz/KTqSkPeEcQFDjofN8kiqwKA4OFsTqcpaiGjd8eV2
         UVf0bjW9UFupLFLw67ZNneJul25DMIkPebduzB3QFUhBYxpH74YWJncfa3GmJlc8QqA8
         UuGL5zEdNB2TXXVe3aixyfGQIP5xlUvSxOvJh7tC9MtnIcc129ggwgQUWymQjjnLNPBG
         aRYRlj9aTgiV+a4NX2ZC4co6NJlmm6ht+jfnnNpUEGJ4OJfbBqfTG3uneiuj/cJuVZ8i
         xHtQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/Er7/nXWqZgyOL6QdotBCtP0oQCJCUZnPwGm5SZ6vI/m4Zgoj+pOTnUKMDKzLMBEmmyc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ4uBZzH8xgBGjQsrPrI84Et5phKtjZkI0KDyd0J3mZg3vci+zP
	UppojsvgGF4mmhHuXxZXvTBXOdS5PX5Av1+awbsAruPeZWFOBhAxCgR7F4kHRUVy/88oAtLGDD8
	UY8XWzXE/H3D4Lay0cXAW8Q7ilSDplfyUakuzgFJQS+maDepT3MKJ0+M=
X-Gm-Gg: AYBFou1HrRmuSG14NNr/k6Xt6XxmtJ/2gLPWt2Om5ONyOjfcsrCypbD4pBmw42dHjyW
	vYNinoLcE4K+tyAp9FjiLciGIdrwO7HTO0+Z5D2QKxMO/bj0UHpE8KxAvypeRLo7T+idnzrhQ/9
	KqfB8FjsBc4mTve1jj17w7ebLaqFk9qiq034DV2Hj6GYqfox874y1CQ5X/i/FF9Hq92d/JOO9//
	8I7FwUHAs4rvNLI9S6xPVdB2KkM5oQugiuD7LuP6T7lS5mc6Uu9maVHieAGbLC4zex68NGL84Ef
	W/xy+pQOY5Ch86kOo/K30SpB5wBew51d6I1pe3dgo+IAwtcD7nLhhcBr0fjXl6Rk9qsc1/cqLCn
	k7eDH+BNrtrOJ
X-Received: by 2002:a05:6102:3f49:b0:7a7:195a:1b29 with SMTP id ada2fe7eead31-7be73c97fabmr221690137.35.1790772382623;
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3f49:b0:7a7:195a:1b29 with SMTP id ada2fe7eead31-7be73c97fabmr221672137.35.1790772382015;
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:21 -0700 (PDT)
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
Subject: [PATCH v4 3/4] arm64: dts: arduino-imola: add support for sound
Date: Wed, 30 Sep 2026 13:46:05 +0100
Message-ID: <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXxZyzBnu+7EpT
 IkMlQidOH+gzZQCLmCwfgEBm6DlsO54PetndeAw/hs8qehB0+fx355lmthnH4Mb7Xj02Ts9KX9v
 UZNGW4zFcJdwQcihKTjC9umK/1yUxsubbyI/Nu1Mg8C1AwAfSLGqgDxclKy3SxJ8xpSnNuLgWLD
 uzKr5bPXRcLxuwvo1UeEsqhIfxrZf4eCaM8G6D6J19y7QECJGWoxEHt8u8SOgs/4x2rB4BiRAHH
 doHDiAuxLV37He/3QwRiRHwmcMgkenkTZEJHxuZXf8G6Iu3U69+5n6n0PDDF+awmYOYrzHd/N1h
 uvXXxZDP2v3GqIVO8cKFyQGtmP86TDzBPW+DxsgBlManyjzACC4HFIHsJMnyHGWq7tjcVpjFMiu
 0agVDuP++xB7qllVic12tCerzpR2FeLmbjcPo4rxDDy5IMlqV5Llbr0llZcmwOUNONdJSxJOJ8R
 DWqsA+HLbGrXG5mWHMA==
X-Proofpoint-ORIG-GUID: NDxPLlmGwz77wBgpQI3jC0XaKAfndlwF
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd049f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=mtT030_wRxJr2dZJK4YA:9 a=TOPH6uDL9cOC6tEoww4z:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NDxPLlmGwz77wBgpQI3jC0XaKAfndlwF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX6bnraiXu2xpH
 jw05cP+hDGsVz+/uWGSIM9Apq5w8Xep0PrN5DMqfrAkE+nCft0uBtR2rz3J2yud5t9VLw621igU
 kRvI2lrVRphP4UCCrIWw99DTj1ezx/s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

Add support for sound on Arduino UNO Q board, which includes
- Headset playback and record.
- Lineout
- Ear Out

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 ++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..85da78aec578 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -81,6 +81,13 @@ pm4125_gpios: gpio@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
 	};
 
 	pmic@1 {
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..e99d2a56dc28 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -110,6 +110,102 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		ear-playback-dai-link {
+			link-name = "Ear Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "Line Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+	};
+
 	vreg_anx_30: regulator-anx-30 {
 		compatible = "regulator-fixed";
 		regulator-name = "anx30";
@@ -421,6 +517,44 @@ mcu@0 {
 	};
 };
 
+&pmic4125_codec {
+	vdd-io-supply = <&pm4125_l15>;
+	vdd-cp-supply = <&pm4125_s4>;
+	vdd-pa-vpos-supply = <&pm4125_s4>;
+	vdd-mic-bias-supply = <&pm4125_l22>;
+
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <1800000>;
+	qcom,micbias3-microvolt = <1800000>;
+
+	qcom,rx-device = <&pm4125_rx>;
+	qcom,tx-device = <&pm4125_tx>;
+
+	status = "okay";
+};
+
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
 &tlmm {
 	jmisc_gpio18: jmisc-gpio18-state {
 		pins = "gpio18";
-- 
2.53.0

