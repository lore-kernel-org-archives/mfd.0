Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3B3513569
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687765; cv=none; b=tO3FZblfVSMvw2OqF5st5oMq2Riw3bGFXYayKHJMXghiuRcV2sK4JRGAai5wP9/5vtxf1N7zYsNdxZmsl9wewLOPNSHfeQlQLvxz02HUwp7zDFc/wxNwgZT+NQqQPb2OqQPQtk36APjp7E4G97q0OOzKjB5e9MBVwvN4t/JkqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687765; c=relaxed/simple;
	bh=8C2QM8PCCveH2S1uREZ+hMj+7+Mn/kc2094lRJW8H44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNNvYJoUF4VZZpZx3BUAmCwbGm78pnB0z4nK4JDtNrxa7BJMGmg+ovMK8jsJdmktDxqnN+xG7fD5ZtEfjDeTWPCOD9IM+f/bx3lgp+IRGtCxwBEzWSKTbTSX7sdAU3KIlXWRcnUTBxMyUS+Z0TjIb9+bg8e94qTDxwsLYnM2peE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLJDIrii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THZPr6Nu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLJDIrii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THZPr6Nu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlRH1577625
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xFl2aUIBjMMRWVsBPz1x55IM
	XDSAEwKxKurM1GPMbbs=; b=VLJDIriiq9PrV56sY1sL1ueS83fOBsA049yjnyq+
	0TPokCrRbnvIKGt/6CkNYUdNJe/1uG3L+TRC3pS72MDWE6OMI2jRdXOQbrlhb6VP
	5I35HltoQzb/tNlp8BOoGT4flYu8m6XpbPQq9Ovs88RR8UiG4RoPpp6n+EysIRhP
	pArvjWR9L1YpFfFAOU3eHGqYWm5/f9MnAP8EnuhemUdNQB4iiOwVOO8YmFE1atUb
	tU5ycMgy8STZxZOu5bRStu5RfKMFYvdaV8oYGH8vEeOGtUmydVUlotRkhP+2sliO
	G9g/0tMb7HLtgKBNH1xv52MrMGKVhyNWyWLez4eUmYc8ZQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s58y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:16:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98331b577e4so3227691241.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687761; x=1791292561; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFl2aUIBjMMRWVsBPz1x55IMXDSAEwKxKurM1GPMbbs=;
        b=THZPr6Nudgpl2SKItdPTiFduIAFWWUZxLkT8wyOche/0bGrrKtKPOMcVYkBXLZ02LE
         711P7LOodntMDboeaVONgOukm25jU7HUmTMhHcwP4OrBqslfeqaO+Ghwt3EB95bNT5Ei
         Cr4nt4Xje52vicqHOA74Rnfmju80xVYo+v0k/IK4J090G89d83qB+zzYO9Gp2ehGbosl
         bB0nEABWGk158m/YNZRXN2ozdABkSpqRmtPSxSiosp/fMKvJ28T4r2/VZbOQ2KB9lXc6
         VuGoTB1x2Y0yjrCNi8e3dJHVHCvKveuVxOmUZT5knBwma7zv7HaIb4ffxjDNZ8+qtd97
         kw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687761; x=1791292561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFl2aUIBjMMRWVsBPz1x55IMXDSAEwKxKurM1GPMbbs=;
        b=xtYhWcrOchf50M97t210HP2RbAwI59w+bVS7YX8m+uneDndsurl9b0canEybCZWa7F
         wMnH3KO6f6LeEExa4K2a/J42dkgjK+/PTYCn/e05fxt7ZDXnPLPujndUjNwxSvW3D1j0
         DmWF9J0YELMGd5r+UaqQyRBWLBJdTpUREabxJ/0mDosWESsTptLyCWhbCUgCkG9DD6SQ
         UzPZ0SOWlVgp/pKbKYa50cvru8T1tk14DvIlsL3umBpHdVuhjqCDu0kjcNXJ6scF1Rxs
         tYSC0NIh1jZyuZNoJWHUoSrV9amzfwqv2pgLXo7hOr0IxuSeyMW1L+Z4H+N8jPMGBZS4
         8vSw==
X-Forwarded-Encrypted: i=1; AKwUvBxpgHX8Il+XpxPpCSvehePOtN13TckoDUX4pNplQliYhuxOlwBsmrAgTq+uq4L/lIjp2bI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKTuP5IlfTAoPxy7irH8btB49lpRKwtx95Z6Xb8Go+hI3bb/7I/
	1ZXGiKviz4G4ZzxXNEDW6x4gIR6n7Q2he9lJhOliN+UqWSIWDdwocV0JW8h/sKM778lF9lCP/9f
	6CjmrxhZDcb//28jLXYmneTQN8IlMVI88tsOxf/f5KpSuQjYAxhhXX4s=
X-Gm-Gg: AYBFou0MlAKKY0upunUXlyUOq6F7K4eYU3Ynnd6k4+8/ubFzhYWc37vopLo1wnF8hH8
	RP810vlkHfe/6D6QlsxGSS6wJr6A8skBfyWXQmDlX7COO/R/0An3PYp0XR0DNmzxDBe/3JGMcic
	87HvcbQOUnqK0a22y0Mv7kHXBHzvE7cR7bLEZlhKqolggGSuvGMxR+Q9RzuzbupJRhD8Vc8ZAT+
	oUR8DTwWYBPDVxRn8Drp31mpcSr4Ti2cAMuM/3Nrz1M/UFaSweE8Nn58ac2sN1ebAtzEPyZ4ztm
	Jpqvrkk4XU3qmy4+WbeS+tQ/v7jToXC3CgEj/SIQphbjg3zl6YNmE1fk51Ir4kZjgU6BseArFwZ
	GpyFE2b6dYIIRQ10=
X-Received: by 2002:a05:6102:f0b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7af1b96d38cmr6642936137.1.1790687761215;
        Tue, 29 Sep 2026 06:16:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f0b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7af1b96d38cmr6642911137.1.1790687760624;
        Tue, 29 Sep 2026 06:16:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm3963646f8f.17.2026.09.29.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:15:59 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:15:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
Message-ID: <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3UbjllI9XaTV
 zBwrUB62VuqIDz80U/fp8Ve3JannRlkvl+qh91b1oaiNzhqVBYDOw93ogMVX3iVRXdFvnvJrMrI
 6r4XVWdXygCw4VF/x2YCkDHN8802lrc=
X-Proofpoint-GUID: LaEiRZO2nvPMhId1_f6SngaaFK2RvByJ
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbba12 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OAj-UWuWdFWybih5JLoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: LaEiRZO2nvPMhId1_f6SngaaFK2RvByJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1lKGhFnH7lUa
 SwndrMImyl4q9zN6rjH/QdNyNOL0kmwAh0XIt+cF8ZnvBwUEk6QyrWtDB5cAMQceveZrCxHc88z
 UcODsjscF59boNYtkISFz2F8aa1pFBjvDonW6EHN2899nxFXkIxm2TyulMeb0fnCpA9rFOZTsLJ
 y63iTAfjbZ07YF97WKATfVe5Pt0TWAvHwvPW1UPrcyQ17eohT3yAE0nOebBf884bRb8ivZI1JYX
 y0ZWwE2khclP2BNDU9ZmMsJWpOlPPInZVcF//9KPv5wDNoE/w8DRvWdFfoyI9h5jDkk0Bt+POvU
 oTVL/TZdjmAAsNy9pkMRYzOzr7egwjbIU5SQGAB569jyeiz3+sEA6YdkbL7N6uPs/Htr4hb+xjj
 1udnNHB408H+l9XWTdBn4jZA4Q4BmacIUkMTV9UjkWt0oK6G7/Ifd8g2zwN5ksO2yIkfGN6OJyB
 e1oU+YyRo11+N+L0k3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:39, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index 1a24e6439e36..52b5fc1ef9a3 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> +		sensor@4700 {
> +			compatible = "qcom,pm8350c-bcl";
> +			reg = <0x4700>;
> +			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		pm8350c_gpios: gpio@8800 {
>  			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>  			reg = <0x8800>;
> @@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
>  			#pwm-cells = <2>;
>  			status = "disabled";
>  		};
> +

Drop this new empty line.

>  	};
>  };
>  
> 
> -- 
> 2.43.0
> 
