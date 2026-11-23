Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467352;
	b=nph5F+1pLBg8MyesOElZ+/kwqQIiNKqY5mrBOiZES19idRO7EDjNH07VVkMebrNCE1/X
	 U1fxrYdP+zKBK3ggUd4azHFONVDn9xFOrcgGdekqP0JI27dyNZRMaFj7eE05xsgK4K0nj
	 H4llsSAGRKKCyTVr4HdSGAe+xdaDOGyHAYXyHco3Sxu5qw0Qq8UIVssM8YWhH1yEu8qqD
	 skn4Mf1uE8PMDeHUFM3d7TastF2Bbnq61UsMRJoLrkZUXOVu4kvqtVFJa4yntBu0jIM8M
	 3jUBd4wcXE+V2UNGybZPduqZQfeRoTvF7sfxWf+1EERyHq8no0+bmf3dUYh3RCIYsYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
	b=1etwGSdutEP4GrP/ltgVtB4Jziv0UkWCRXmOxFQSxgeAbGchmvh4djYSVwDt5oXya+Ly
	 ZAD9dcVvR7r9w34xxdLKGHrjoG1T60Q3xHAtBcN04WRGtHxndTsyiEy2TfBDM4AdcvkLm
	 8gD6SNcfR2ENEbekn+GQLbTnLvpaFOFMTpzADdZoz9nZ5lcepI6W1v9VIeTJxkGFzlsKS
	 i3Va7nnkIghsupvxsQPCsotkYLpaaIZuoOY7WPYpCfcHy1lXcz8LGd7dCeXoWbqIdnQ8A
	 pwoaD6Gb08LL4gS1AsGI2UtmlqPCrN2SGwc3eeQqL+rot3RXuGXnJEM1m7bdY5Rwfgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZWCsnM0D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42C606A32C
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D42C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZWCsnM0D
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJv7dV2828352
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=; b=APu6pruJKuRJdjIk
	YeJmkmvT43n9u64h/gmBKxcfibSMm4ZFWJ8ET9J3EmS1HcIHgEL+CPHry1D7KyK+
	/Wq7SrlmJhbrrnwrHsH+yAYsHHnAUo//U6orKs8xkVro0/nbKK7qwrBAPyytH/Q1
	rwXx0O7nEH/PuCcZXastnf5jwxYlhLo8VuwB+TD6rtwzfx8oINGwQpPi7goZTR/p
	5588ryxci1NWoZz6D0C1/nQ/eAeJ0YkuCWySf6ogCe4brNMNucKafcmQ6ancKnwd
	O+tTfpt94MvFNq2G/C0DAYz8Qv7mne4Tx1xmICX+H3ikd7FCJigAfAu3G8CE2odU
	v1PkNw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3m83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a7af8b94so1775820eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467351; x=1796072151; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=ZWCsnM0DwPp/voqX7Wo1UlVKOz5QBhNrwfCevBExyzomOBkEUeLGKjhvZoWJIjpcR2
         9Fts/XhQAyWs/allBZ1oc60mVYcg9iThH76rtQgIkNQQN4Iy8lbJ41LBX5OsTp5WxT7a
         g5Tc8VvOqRBXbbyzn0wUKCcpE0aCL0i42B6VkGTzTvZzPi15GPOxB+L41M8pXyPY99Mm
         un3ibreabt1OwNhE02yNbPaq+2aCFSRavcXdL3tmHPjrMCso2jmcUAqhD2ElO3XJvWaj
         a79zN01pN5weqaO3zuNRQ3IFWrtY9M5i6hD6ODfrbhKt39rjSVi7b7N8MjEP4bErMuI4
         oJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467351; x=1796072151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=qhz4nSFWrHykvnKe6bRb60G1uTDz+bAGPCvG4zRLvTWcifqrFmfBLOjcGAMLJ58TOO
         d6LTnloRGlyM4D/3RP5L1dhQDpd8lesXAQUiCyaqc1RaFsmtP8R+YkxBOCE5qPr9wvSg
         huc6rS+KUI34CgTIXL7WzBJ3UwKk8XgZXrR3fY2Wr4+mBOp0r2LA8fGbVFcCs7rMBQHW
         ipXW5UTpyjXxls/6xr3dx1Y3OAHYCPb2+AFOI5xAMmtAANDHmM5bMY+NmnF9JuwJNfn0
         EInn/2ArAxKJFiwi3Zb+Oh/nHU6eh7h1Wqrh/pmS2A6V2sLsVR227k8xMfHXDC+QLtgh
         QGBg==
X-Forwarded-Encrypted: i=1; AL+hErGiE5b2Qpu1mnlBS+nOFoyUj/FQOMedSZsqFM921/SAkRRCLx+3DkBMEExuxC7PmhR/VOM=@lists.linux.dev
X-Gm-Message-State: APuU4Z93I6zvqkNIr48OZqJWIO36+HuHdaDeTCdWj1gb1RjSlWstNPHs
	dvb/d5JHOtpjPUTlkxESwh+Vp1wWfHZ7Co1/NfNnjtfKH+YljkoqpW5kzpRRgHJ+XMO3k8RhQR4
	DESVlJMlUSAqwsaB2MB4QMRLR6obHYvImhOo+cWU9E5p4Y9fAzxrtvIw=
X-Gm-Gg: AZFdTZf/HSqbKqWtS4jS0kgxWJwCFfv1xiQvjHJ1Xtrev7kvNSdvMVoPRQkMDwxRcLn
	S8w7hKb3J7giFcaNBhoW533RAUht4/fjgt6JyDdY2xAY+8xRwUTzNcVzxl+soTt2zSwBrn/ZL1J
	leygyQpEtuPZg+oU13GUN2YPo/dmXwKH0C5Feov+WrP8BVt2XaIPs1OspskKRMZa7sxM03hE/6T
	NbM2pTcYA8xYspsEWwQfKX7woT0XW0nkqeN1f2LxEJZE7l712D5ghWS1H9o9YfQGeW2KDsyD4MM
	H9FsGFwFwkSTeGdskjRuPldG2b7BaKkaLaXOY8+DRndoHYgMbDLhGbN4/4CENmipzOEHbzVBK21
	jiJih1fFruREh2XYvv2rkkMT+cDHsEKgdLcMMEF8KlsaMo2k1+nv4QvpRqZI6pcxRhA8HTtfflh
	kFFnjig7hV
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555341eec.2.1795467350690;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555309eec.2.1795467350116;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:49 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:47 +0530
Subject: [PATCH v5 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-7-747d5383d538@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1207;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4gGZ4kBU9Ca0wJlDsLv1nEPxLz+5jyLqksSuJ+sGbGc=;
 b=RBVFLuG5HbWKUBG5b/9FUOJu/oqCo1UJjR508Mn6KfkxgGlMz8FiV3zsD0z5Rvk+e+mKhHNt+
 WlwErK0s24kCiiizyVJ3IlLxn8qznWUq+p/iymZiRvTfsMAQRtch8uZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a857 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: rVozX0cGSnGjunaZpya8mhhbFIo928wE
X-Proofpoint-GUID: rVozX0cGSnGjunaZpya8mhhbFIo928wE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9LNACSXHXxXp
 SjfHDsQyyUq+1kfsxk/jBQXaRnLfjgZpHXXQ0qTaSEYchWFlS+li2fNeOFS9aIeIimuccZyUYkv
 Q8FpQxEe7hwG3rxlIjHWEFx4evzSuMA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXyAFIeJ2mD4ld
 2Vbc8y8stLmG+forY4OqK/iyINW/50+uYjOt2098AT0KiQg2mpWo5TbKNEFkLbRCSQsWNM/owjX
 OQXSShYi9wdKufdKiIp3dYWdS25YvhIuLmlAAJ8GWpOeQMbQRBnnifULPSdNUEWINrDwQndueOW
 /A97qiICoOwhUORURoTvRe9l8iv7K+2hYmsgWxC7JOImYFf+dML2L8lq169RapFW+IBwGdga60K
 W2/L9ASLtXaJWOKIk8xhgkh8xzIzKxd0Uh0otlF6fpoA+jLfGbr68bjU27CCS2CrM4x+9Xk7+af
 rKpFlUNEzBCbD9YqdNkJc5UWAk5iN2cx5oyDKza7KGuuTKWMZLJ2twluPdG4qOXe3ZQnwxnCtwr
 HTUfHEaWS3qYX3nVqv3WyPs8s2TARQQm4Vm7f9qFQd2oiAO+g6PS/RsxJW1KwNdP/hYDaxAhBV3
 hJBKxUSZ31hAWUZ54Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..d9e3a1069d78 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

