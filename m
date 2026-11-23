Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467346;
	b=jJTSfqKShe6wKAtBCELm0nlBcr87zyf2OF7LtMYBd58qhDKNv7WrghKt5CeJp58x6X5U
	 gcNteNV9kxZyp+SnzZCqocOmaCfQlf0RIZ949GLzCu8Ggcpg0JOZiyxOFon1H7dDD6lTO
	 P5FbKZadFfU+DdvTsoXm/NFfyE2NSywgJ/ChdIubvpyiVBnd0bA7JjB107VWboxdCca/x
	 oEfDp2GwPW6fwlgcl98D4FMs/Vx3j2kNPk9vAcg7JXhdj1QSgDbJcnmw9mQ+2KYwVxE77
	 0vsb4NCHVQZHjN688CGOWSgX77yrpfPiLYJjqIwnjVfuLRhr+LbCc01vGk4U0DZZz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
	b=KGTgl/6w3ppzXbm4Z3NcVxp2ghXAOJQkwtd3RWsc5O7YfeSQfOCk0873HCsudKh1boZr
	 QYvRnC7Oilmu0F7SHN/lLd2uj0nL0VarLWe3YG5AQsFX7Iqru5SAcrf1ue03wxwnSJFgl
	 Ghpxt8R/MJCVsP9+xnLF3Ko7SJNIJNbgNqiSp5ncb760c5/kH+q81vhnRzP1+wP+KOB29
	 DbjRyrodY++MEE7m9NhRdgFQk+IeqRCsS7pkyi9PLo9ssrzdUWBKzLyMnSOvH4kzB+oxn
	 //FKCoEdf7mSZqzUNINcwklULFjr86eGx5dIeZ7DiYSsg0gNgc9wOmVGcGLNsgKQZUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2jNLhoa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B98A606A32E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B98A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2jNLhoa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuNar2349969
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=; b=TfhYu3p4HLmEAiBW
	Ys7hkLgYGRWjH2zZ2JTzF/Hy+/oTcf0+qFKPXf+uRkCIdFMimev2n4D8JQvok3J6
	Kh6ZNpFq8m26tpUe/caZfgwnDGhD0vzsoH6Mk6oHJVNfV/6Si9txQhQ0veRvGgzS
	omeA+pcT6ia9XcwcDo81OK+CBnVPr0QXKy+eMtoJIi9bLdTXuienzgQkTjwsomFx
	cpuCZTDG36vYNs+xyjemhHRDbT8E7DrFh+SaOGC7Ei6HpULF8ykRc/3TqA9AQjgZ
	G8Pbu4uTDRZTdZC4pgMKclogz9Y9mkcLm0QOeOrOBoaqz/6JXisJ662s0C+hyK87
	toh/1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3cw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so5565341eec.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467345; x=1796072145; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=i2jNLhoaeYhT0XQi3uR6E3kb1gD/5oGixQmbVSYNkZYqiZFnlfLRIUjS/bcVM63Tli
         XECMhoBulsB65PxSyPVPscRXQ9PXhp4r6JCX3PjEzak9IPatzvtcBCW2f9nCBVnjQQYq
         NRqurMD5lxDjM2TrGoscdESvJw8/xXRiJCaF9eZBY5lG+f/4Of703HAVfLn7gQtlRDi0
         pOgg89vNhXROsA6PoVV/T9NjDci7g9ZM4zaF2pCqMnIk5/zC6i3cGZD0HesjOmcWwRwt
         Y64P5GR9Nv+Nzr5QJ4nSYhwLlTJvRS7cH8UWJBw2UrnaJendGyuQFykiziB7g+EglbBe
         66ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467345; x=1796072145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=AqGdcsqVowUU78jBokqNbDG+ZlX00K4utni1sMeUyQ1Wnm8HRlU4ryCIg0fYZlcsi9
         u5AUm4+se8CUbpVX9OjOoDw/n1TpoJs1d82nX6FR5wdIbBSE18NIXvlK0ik2HuenDySb
         OmO2JXBZ4A2ZqSPXuUfUJWrepQlIoJ8U9D24Goy+2hi6mGoeHh0c5Gj3LGNuAbm1Czj8
         UwrsZKNKF5OYrnOgY2PuPCFfhJjiRR+DO9fozHAKF2fGfJYcNj9RD9vowdzcVBrFpp0b
         NxJkUuC1sL7H+wQbWqKlF6wx7cb3pbvBi281/FncLuLbZgps8GS4Pj/gDwpyre4wM1Hp
         DdYA==
X-Forwarded-Encrypted: i=1; AL+hErGMCD6O2VAorX4FucZ91a873Il4sXx9LaIZ5e+/sxZzowcncfEMVHdP97L1r0ZKHFyWe2s=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/g92/yB1iiw2QU3F7Q9x+AN3kUamdnAdh4UZ6QDx8PPTtrLr/
	nNrFNsCnCUHD5WjKIkcRt02qAhph7VFGfI3X39shSg/n4qbxAwFuv6GwWirO29pZf+KX+qG0a+K
	qvs2PhRNGkeERnycZcxn2xxaLH42dFH6Fo7sAiYOmdW2UduUqzAfPNps=
X-Gm-Gg: AZFdTZcaqWiDM7fix4gJi77V5suVC9bRxl1+ifkdwg4UGllLRS0H0x6cnLAVv+9A9l7
	U/0ygAERJzqPTX8kXoU6gnLnxgll4TJSu0eftcPoyHUXPFhSVGKYGjREybVL3HmvUdjiQtZF47+
	G0cxGXlGzFzNFzK3y7gEO51VDL6s95cwhhDu2fcv43rcq9RH82BIbVcf3vF+kI/efpb3Rfpmvc8
	I58ndPRb/u52DZUc9CCvWXq6VWLJ9cqbVlK1ey6E3zZKUynSheIT9zVRDX4KafgoqTCZGQgfdyw
	6PnbgS3ZSChEGrP1GUV2t7nR75K9HSFNJbYMyP8fcSQf1jUrD7ZM8r/NG5sJZ6yj64YwWJwt2Fn
	Qi49F/WNl7wYQk4MVM4bjOtNYoWoMKeHjkOykckfx8SocePOZXSe33N1b9eYH4HAHbXIH0IPHmr
	Fyk2vg2ZUk
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202074eec.31.1795467344557;
        Mon, 23 Nov 2026 12:55:44 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202032eec.31.1795467343843;
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:46 +0530
Subject: [PATCH v5 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-6-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1301;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ULRBXyIFz867Nh5qIBr+xcji/05W1S7N0crGceoW2e0=;
 b=XGzMJ068AmLrwGRQFHZFLFtWzDcU2FDiEN2mnxyhJfAeDvIbvp5Ol0ciu4Eu3D4VdRnPuwSnH
 20QpK2bPny5AjjLfjdfTcw0eenprUoAhNjIvJZ2etIKzHw0OSylz7HL
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX3dYrwiuZaOfe
 SD2pFIbpfZpXDlDpVr2wX7YKOVAdPNg9VQf6leDrHzRlXz95cr92iAAb/lnsapOVtnPqH32HU6P
 HgbLlR51PJqv3EPKlY35zz1WfDn8GlA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9h0B0KpE+Wdo
 8JgDnBhHpv/H8zSbhu/ZfqD93kkLV/MfuHdgJimnexMLjM7N1O974eEdq6eAkAAdu32Gd3kZYUE
 f5zXpkDqwnHPTcluZvvgB68Y0V5OUV/N/jJwrDYZU5HRmMUpVkRh8R4B6AxdtMIVO3jsg578BsV
 6CkWj61rDHcLjfjAmi0I/3gPn0opxPkJJ3bsXtQtaX4GbnwhZll5nIWvmmadts9xOXo09WhMpVK
 QlK0FeN+kk8uja/uWitvr8tt1OjL2nrAWf5oZTVp0i90IhSSFLDh9BrN1ID4j+x8bY+z30amiue
 967q8t8XWmFjAot3Hetfa2+aqbu/N7NA94Z+kCqes6jdpmyfGv/806rVWPU5tN0VMXbviM8CxSr
 PPT1v6HSHkoscOfq8hwLgdXL3LU9rYQhilRC/XzXeIqoDzZl90kua8gc9/p/Edw8SVZ4O3pbQp3
 5Ee70XVdUzt+AmwdaYQ==
X-Proofpoint-ORIG-GUID: DAKbGv8lOTyUqfDDg7JJ3_X8fI1kKf6I
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a851 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: DAKbGv8lOTyUqfDDg7JJ3_X8fI1kKf6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

