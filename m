Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467339;
	b=dIWt8fZqP/+uEmvc74Tzlxqg7QjIva1jfshjQufGbfQ+hZKb5XqhIlLZvxFWe25qLp2Z
	 JrVtSiXrsd41R40yXj4yrHtLxbNkA+qFefHpyN5pDLnKRmLrleyA1Ga0bFapUginyfjHX
	 HCX4s3vJrOaStxnvlz5SZmJ437qeFoFbrUvpCcs4hxb7eFB4p9fwigkBVHdYVHQvwZ58S
	 HTN8EI29BZ9DRc5xmCiRv+mfV/5OqDTDuC092/rVrv+30YrV6ZsqSTk3JaxRL9jmyFWPM
	 VpaExWJKZp9oPUPhKg5LMHOTsRA8HzUH13kExKKPGRiyTAG05FrCHM4itNGv/Guphlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
	b=3RiHECrjsL5k71bAqOkpSeKf3BKDfe4JYWI4BGdqD71rEv650wSmS8pzbQh9udDoMyuC
	 2bdB5xnNEPGto0/F3/cBIyABMP9fj1naf9JlBhio9H7Ixfwi/XKboo0ciAneFGyZadSVZ
	 z6tUl/yk51Cak7UdxXlslwOmlAB063Das/g0ZIrKKp8e7aFjUBkMzHT9Mk5iBI+Fd5UVX
	 HKw17piBtWktM7SAltboHZvqMywBgbLJUvYNnGUjitK+OfjPzoLqoDfYZD7mw6FS/ENTV
	 DKyU/puev1tiy6it+RDTKnc4WkxU0PANDfX59sjBvkjwtPu655xyusmytUfTDDJWrDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bloUvL45;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE6606A335
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55FE6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bloUvL45
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuS353255353
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=; b=UWLFtAe2S4Q8jUG3
	mTrIiniGHu/xf1FQ8LVv7WN3T0HiTcefhVSzp70zVDcu46R/EiuwfBGr2oSGGxvg
	9+zfFJ5m3j58wGgTWFJ2oxM6Ul66PA2Jfoqk8jKiMRMaS+zBnoXqDJopwLiOixKi
	EUQo1bGQMsTmjE9Hv76okRuAIWfunDw7UcaTX4vMF/DmWB5Lg1Q7/m2LYJLB+bbI
	j8vvvTDgc2DtbhnxDvcsaHSn9QtDPIiSPz0PO1POE3uk9nj+o5Yw0MP6DkoS/d3x
	KAasvX4e/U31MVLVZNeL35+PJ+8dipLM7OgAOaW/JlbdIGxCwxLTqgvRJJ+Tfd1v
	iI7PtQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbcxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4183193eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467338; x=1796072138; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=bloUvL45zep2Zod+hXliM9xZg6BbEimNBVF221nMvSdj29ZZ4SnVZyEjwscIHgZoZY
         Vsxbiyx+hMVVzhLcL6pVi7SwCEFzVXRDrtrjagd/70HJglusF2y0CSK2GDoozqXVJSCG
         MQNH814BNj2XWb9z8KPjQlR/5XTI9i8DA4fp/mxLKO1luK4Z6hLHHp90IaYlbBDrV6Ri
         PDwd96rN1+DZn8IOhM2SmsVh4h4DUAbF3PyGOPbUqmD+7E9ItfDpgVyidrGLG/HzJC1u
         3KXc+tVsiX4aSAILRPi+3CXQkHIG5yhKxPGD5fatDzdNfg+gR+NoHfhZIOPhDOTeFCrX
         fssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467338; x=1796072138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=QxqhPksS5wMYtHT5xKtpfAN3p5Cqi0dc6WfxYr01La1qlnrPtA5w9nntnzoaDFHZgy
         tsJGvBWV1X6AhysIEdiF9ybV6oZ0k0aVsUbhzfICpsxW+t+OdXNCwd0Tws+r5GjYETr3
         ofByFJOpKyxQjlN7z7M2hFaM/oUdTGzLwAOxkL6+xbBSbUfo6h7R08zCCNpVLohxTld/
         t9TvThyZI74dwMiDJvt458x8wZroVhKYH2i32WCB1/e/Hte0LnzdD3oUF/I+VIp7ie7F
         QKGL3aYeXLieyeRLKJrV56gu4rl2cfqFJmePRFeSdSC7+c5cgY67PN7bi9CSGpK4v+H8
         VKlQ==
X-Forwarded-Encrypted: i=1; AL+hErECg7ko+esSEJIEqtpYaNFAQl21Pq90cAeQLzvCH8Rx7CJnchZt8+IE3gTm9iSrGiqFnCo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+q9J55dZGhokv4I6FEfS34MxLlnM0DSwsCehcZBNelfQExg3K2
	LIzRjWKD2r+5cnJy5VH6hXFQ+W7jB9PajybqI3p4LAKxXaepFcVQgvRlLdFQ6gU4pdEZ1T8VMgp
	2/sbK3TecIdxevZc/DLxQp1zy7g9P7mRn66UFjh4jMVFOTDL6VXxnDto=
X-Gm-Gg: AZFdTZcFMCu1U8zHMzYFbYLikOwz++VzcPHL2erT5dqtdHYjrmH6TmN+n542lsZGP9z
	lppxXNFrGbGOEGoquAGmr8cpYlANs++GF0+MraxSKsA+DG/Zd5i6a7iwobDT9qS1zUWtcOrlMry
	SXJT7+2HB9wcOZa59YD7aXfEs4X3kvvTPD+FPS+eEDyKyKA3OR41sAT3y4iXzdIcGlfVnO956jw
	C/F9989G4TlJuq3SAWLAonT0ex0cInasg09Ak7C1G4amTDUc20wbmhkq/t3vKU5tUPjCcyFBR7N
	NTyEg9M/lPfvj9b2ioRTpIGpwplS98fQKPfHx5wK4mcqqZn6w8xgqhUp0vQeDtCHVwH/hCEVBj/
	w/gfyngOj5HBlvSuKq+HjQ1SmHOorP4cRKUG5bKNpbQpaLN6cXdXaMMIAuZVaH6XxSyCLFfOrKY
	tr1BQohyIY
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295851c88.18.1795467337918;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295807c88.18.1795467337385;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:45 +0530
Subject: [PATCH v5 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-5-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1300;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=TQ8oMR4dp6+o4PLOcph+lfW15bcDXGH73jPsR+cwzaE=;
 b=C5ta8bd5Vrxxa5KbLb19w2pR0Zq327fKQRmZ4/uw81a02s8hsXDOFC662q0c8jyTj7xt/Wwxl
 kTo+phYoe7qDJH4Q+Mo6ZhjupbPnOQacYERjTqPlw/DkZBFXITGkTjB
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX1ZcmWrximdhK
 IilCCIRAUYdRuS30RJsPrzMZuEgJzmnvMYvvRNdx8HJylq+DiBeYIB9EA+dluvcna+0lkFTGTU9
 YCd02pxUmWQ/3R+sjF0jHSiSWG+XLhvfkub1j/Jp+TIIeyIMhKx5uXhwfRYEfzdMlsps+9/+fho
 vEXBc1XDTqleAypHFdCen9K6ldfWJWIBV4t/LfsIzxdW4RZBvzxDoHFGSZrzF8ewRQm59TB6EFy
 geOUmhhupV0/BSm+Oz3Jh+qyKgdy7pXGAk7H+p78trtxf35k6Xm2toG6l96y+h4CM0aKC3+z2+b
 AJdRgGdGqDzrKAy/OK7z4/KABTmZTCcka5N/3Fh1bP3Rm4pPlyzls8NpAG150ooQhWZWnYVvHY9
 wCfC9swRMEwh++vPHQCl3Ujk7XrXnQiekmS5YaMyAGuNJixvwNfleameFuvMG6g/6LIDRq07cOJ
 ruNvOQHX/1IWHN3MeFA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04a84a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DEaOtEBWiv5XyyVG44zhyNKLc9aQe8jb
X-Proofpoint-ORIG-GUID: DEaOtEBWiv5XyyVG44zhyNKLc9aQe8jb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX4BMIxSc+hvH+
 pVPQK0JbAUB6PfZCHcscSvkbzUdWPvjKVtrNSGSW5VA72iXPxsP9di3JkSTDh3NKT+vGL3u7pck
 iNJTayqu7rFHYObIk9+3e79Jh4b3Kdw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..72a70b5dc9f5 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl", "qcom,pm8550-bcl";
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

