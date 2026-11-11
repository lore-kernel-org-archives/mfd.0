Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416651;
	b=SCv1vAuUegdUjkD+NSA7E6I5G0dv0tuAA943DFh+gNSLXXt9eaITfmIQuwHKz7zZhxY4
	 yhQetdwy9frFEjHla6sD4IhBF+Q7eHl60WC2+7kax2H2mKxes9QEVwqybJZnKDepXusAz
	 2G75ZPk1LwYDSQhz4qkoz5GH/An/FIAJdv6S1FGXyvpgIph394l6tihADYxjlKO9rjp2f
	 X4DSiTzcaRDDEWyT9jUX70Xy/czWCpHE44W7bkI3fjzXRxew0fi7FILjKeJAKOQTbf4vX
	 d2/8/iN04l7sjDsC1DbQ8NVwuQ4uLHjswwRYP0t7Kf9GPvht+TFH/3gBQ4+X5NcL+5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=H9DRQleBxNSTmQawFQoh3akTpk9noCHsZoWgZcdfJVwI1lj5495j8RXDNyyRxu62KofA
	 FmD/jzYFPaZ20IuymmJzA7wDcpFVJOPdY9tH1OCqc9I/UTWf3rON6dxp251+47SvNjBtk
	 WzJcb4JNhsPpfQILUE77JzSlhDZV4Im8tUVsn30AafE5qFlCzxjOFr9ftMAIQA0rzGsek
	 Qf50W//qQsjhqg1NTwNbMoLTUR4mZiOMoZhWngBdKjUuA0l0Ez/O/F6DFfWbpRxvXf7aN
	 zNvU1EUMxVB8Gjd4A+zJky7HUvnsltAEuOoTExHw6T3xvAcDcRX7vzHQQExkmX5lEeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMrv5y2S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K6lg/4E9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9DB606A331
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9DB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMrv5y2S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6lg/4E9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0P7X1012613
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=AMrv5y2SDEj1201W
	DsPJqv+W7HO6XEwF+NSlGw2wfde108At7Bq4KcuYbTml1XXLLOuh06F3o2BUuGQN
	BMp/L5CCvnnEzQaBcH20VUH0FB/GVgWbYPAqngvNfMLMMenxSYpygWDPC8v1jlpa
	SO6I/A+sb7kphRbAN/KOzHqTdEDthKjoiSXRHCmmjQCGmvvdEcKUQrLQHemYRUdB
	dxLQrIqa6aDLx1KasgbZRKROrInvRw+Dn35K3TWnnsvdr13ECX+NOb85Ctqub+hs
	VGpvkWul4tWllN3DEM4Zx50wVLr73mrnWhu5vp2slNkj8pw9bKri1e3Tx5AuYvML
	+C6sJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34jud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:04:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso2952896a91.1
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 09:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416650; x=1795021450; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=K6lg/4E9NoM5LFjpw9ic5+plPo/NnfMRzXOI6A4BGiYim2vGXCa1GTsy6mPFgxoSnz
         D3q3Z0ZBvN7o3GB36vCi/zKKSSk0QVV+8avqhSd+KeYI8x87FaOaRpL65unfBtmrIxSb
         ipLcB6C9YW16ZRazNppjVl5mKlm7t4+f7qk8WssLdJBbnKxiRZPWPdSw0W8zlTBWqPHP
         lRzVsfY4A4VegrBx1v/qblSx/hAgto8viVb0mlbJAcDRircD9VdAI0PlaVpLPFkA90Kc
         MPFQ+yeOsjU15uyNa2pefcysnbgpvkE3kDKn9HoLRhusOZz1RGXoaSAYkbDxDnwsBV49
         MZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416650; x=1795021450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=E+T0lMPIr+m6vaG67A9W3SvgiFGS4aNdtdvZ5+BR4a3iY1w8O0Dnss2hdR1TftdneA
         Tt8LMVtW77ZrxmiLAFIGnIbKhLEzkEnzmxKhhpNzewgs4opD58evSJh6JKghmV6ftxFp
         2Sdcc1kwa90B+c/X1ChPzFlvN1llR5hpVf7ksUzqBDPpcBGBLardstU4XxdBe0hzTiQP
         aMWsAgVDHU9xIkMoOMCLASSZXfu1Nzlg3V4zpIYekGaCQ4rhQ/y83Kfm14tbftz80SQI
         HnaVc5jau0mtFjzshQRz1xw4/y0JJXzrVjx5rVGOrfgBT4u7QsOKH9ieiL+AR6Q6AT4N
         ypXQ==
X-Forwarded-Encrypted: i=1; AL+hErG2SqFLswff4UnnoQzjvXkbSVEuSODCU4v6wMwJR5limDrdy4/DfKWPydadwg9Nx72f350=@lists.linux.dev
X-Gm-Message-State: APuU4Z9sOyh9U/C/DsvX/T47LT2UISUYSRsSBmets/b0C1h21ARffU06
	mPcZR+FL0mgDcsJnu0hExjqQEeOqmefRGkOT5voyYaJyUhULd7Pals/h8l6GlgYJWea3/CRRgqU
	K2Vt95DG9e5t1NCYYye3QeW35dc1RGfJcZV+0Dxhl1YyzYHNS6WR88TU=
X-Gm-Gg: AYBFou1XP25MXdPbkhihqdkeNLlLNd3gYgTIblXSi2Jc2hl2mx4SsgOVwawKvL270n4
	CpqJzaYDi5fK0qf2XuyD/BCQ5r5NChyktsb8fz5c1aNLviHPd0BF5Jkg1mld/SihyYHDjhjQMnO
	Ol8+exIUQwvuX8TPGRkhm3NxdNVh8uu7KE49dcZcFnbzJcCax0V2CGzruwjUS8Sbf/Zzck1bJgX
	yjJy5HK08cWiH7WcdLPUXIlWNo2AkXbhy4WqlB6xJZ/FOfpmgdHeIQ9rzaNJMqMcXeTwID4UVL9
	LwX7+j6l759rB+EeXPGUqbFC88MUP9NjnxPC2IQ3vMO7DVCzdWRK321HIFdBZamvSsz26UUem/c
	l8UbvC/f+OUGbYwBR3oOCSM7+zUqqt2QdExUVSFazbL+2IQkinJt/aYQ2pQMULkoK0uY=
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr2767183a91.43.1794416650099;
        Wed, 11 Nov 2026 09:04:10 -0800 (PST)
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr2767168a91.43.1794416649690;
        Wed, 11 Nov 2026 09:04:09 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:09 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:55 +0530
Subject: [PATCH v4 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261111-pm8010_i2c_support-v4-6-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=feaEG2hkVROaB8EYdcswFevmqiFEx+Eno2p6KQHNxWJaUuvO3Xl0tLWruMpRpCxJoNs351DJ2
 on6ScmDiLKWCSqCwaIOFYwv3fHlMaGC3MbVvmDjeCliAWY2/RmXm4bm
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4a00a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX9vxgbqAmhh2f
 zYPARsKoMpwBRkUNRvgJCrDoq4Q/F1IvZrkf3W8ydIDQM7EkdR5fWQBa3FpyxGgcBT8dUMimxLc
 uoRVRd6F8M4pfDJMp9Cr/xK5nj8BHrnCu11lgoEdCPNggHf7W1+dcEd/W4syP1k6Y/LxBLkeuK+
 ia+walW+L99jhs27t+KK4Y7v0L38BgbfewDOED1nHUZjSl8gBhkUDRwW+tp6J7TfGXvmZBCpVQB
 X4hMo2l3mZX3y4CuL16nSllOV0R8XkB+7mn8wsEh66wmE+xOWT+gI+mP5FS0NMsvPueF2rMhTXn
 Pga6CJHeIPpwsgwwMgtnBBhI8dbPYGtI3xkGGqEv+k4+j4d2nYrM+qrJ79tLI5iDnKlVgPZ1hiB
 Avx/plvxFpC+gxQxSxKlpGCtXjiwuGagk32Km/hGc6NMPg6AM/1rC6YkDgxDVNYY/WyJSlUXSlR
 P3Vi+f7HBrrDpXp8DyQ==
X-Proofpoint-GUID: dT7V4lrhb4FlcYToD4Va8rtzxiQV2seo
X-Proofpoint-ORIG-GUID: dT7V4lrhb4FlcYToD4Va8rtzxiQV2seo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX4v4TpgwpPiwt
 jcx1iO0+YPpmMfrJ9sicmX5xwwZEz3Vs3DTzxJNo8duEtqD9RNb5qjrdN/4vBck0fycOd9Y/xdd
 N5eTRgBM3IWpQA9jvlAcZRYZmSJeS8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

