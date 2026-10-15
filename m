Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063644C4FB
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055685; cv=none; b=b0ZaqOQUPTr7tNEMBVnFarT4BcY4CB8L4aDyEsB58GbsqNNSRutCu4QVeph3+kzOdG8TJx3duvSqZ5puvdN/f7D01Z0JyjN4zHoBUMiBMY+BE4dxIAzcb6LPvHkYptMhI2mz9gPbBmkHaefdrcTXFpxbmvZH2b1Axfx1VxdH9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055685; c=relaxed/simple;
	bh=NdMk2ynksy7sBjLxlWYdSSrqCkDbJYPWnxILUrgM718=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKxDX0ZxTcNrn7mrg4e2/6LfeErReWA+vGXnb+Vc5c21uu85v57okmeUgG04ewqFtUnEMNsBj6R3jwdqXNhnQtCpZpAN3Wahery5PizBIO52a7zYEG8DC9ynAvjX15M1m/b0WbuxGXb7jKJBMGa63s6Qx12+nnlUAJV/1YyAg5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoFaPHI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXF2JGEP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoFaPHI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXF2JGEP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7O44t2121448
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=; b=aoFaPHI54vkSpmpD
	a1Y6KPj5BeUeWY3unHT9VmZYPKV11uJlgoWgamUUQ1lCJg46kSfwkeL5kl74rFkE
	6B2wn/JhQdtGHCJUCeBAls0cFWaYnbvG/ar5Sqya+D88iCtKtAtOEKZLkI47WpwU
	9lMtlwBPzPp3YvBEy50OQ1xqScyFM/wVEqaPrukX6XfH2efEArOL83M7/CZY7Acu
	zG7LpGcQw6+UWQpbQ6pgPf+is/sStmsOo0Moo8JlLqAJWdxaBZL26Y0Yy5YH1yzf
	aKNvxikL30E4J8jBFTi37uRNToib/G0k5cCVa06LFP3Fxuew8qgSSNeJjNGx5n/B
	jsiQqA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1xh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:14:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso13367996d6.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055680; x=1792660480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=;
        b=CXF2JGEPNSnhgQLL1yUa2l3iq8KEbyNoHOKJT4sGhXRGxNVuP+6brKKuXvMKXbJU9p
         X4Kz5EKmlIfVCC6wUsO8KoQM+yYuM+jfQgmwPFcwcgaCF/00tnxkBCq6kl/7gAqQ1bH/
         elQ5ClJRhaUfgmw8cd+XBTMd8qLFFZIxf8d7noA6z1GaA3T8GbVPaohvnAYz2dnen/T/
         ptvQ3NmtINtjCgLLw8Bn6UaRgU1kzqeP1hgxI71CGFUHmrmTaoGOtyiN2rDR9LjOdX2I
         XCq+rediJFTIJfde0oh/OrHFH22dcvkbNP5eeS1MnkV/lh/ygE5wPDAS9kM/69EB0YTt
         1FaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055680; x=1792660480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=;
        b=cHEoDKq7w8MfKE8q+MNfRpeh0K6xT3nthhX9siUZao6MqDbPXbwzIUxCNfBaTlMc6s
         RjzcHdjtvvnLB2/BNjdrNjwak9FvfabS2YyzEi+dYoVrBp7EEDpiB6idasj6M94jbj8w
         mBd1g85Q7zyCwcgXnuY9XQ7qsJ4uKGCc5s3flTH8Xcz7s3JcBmOW3PA26ZTKmxqZwTp3
         FC6FdpjiKYvjm6oObkSkiyrFvA6rGHQZZxJq3mkrqvEnMEbdNkxYOlf6yd4XFCjAe6Dz
         QtIKHqxC9MokxLM7IqGzXmNcCqg5Y5bz4E+eHvHJoiHlvLHlUimBv3IyQNQnGVYb/GB6
         q1UA==
X-Forwarded-Encrypted: i=1; AKwUvBzH6uRR0Wh0X0F9VI+4ZO4QmyVFbsKA4W1c/PlbXJxxdnmBTSxSL293ypOuPYZSAtcyn8Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYJcALevHzQMWeBSad+tgCwQlUPCLi5XGQKrn/CplG5jF5eJOyh1
	WMuVU2o/Vgoek8PTQl/QJRv+PsfAjvw/S0eWLhxzZmhIJ3Q3wIRmyOfBSYy7BA0ZE44Zq+h7FWS
	V5XsscXDEESyd4/bTkugHefXSxM3Lw9pHew3yiELOthishtNZNeRb8dw=
X-Gm-Gg: AYBFou1GMgRM1KfJTQ8pQuWOwQ+hMWAielXUlCT/iVJnibyMMcCeDnQ7/QgCmj1Dpbh
	CxNLFHfBcXwGrZ6QQcytwkOgZu1ain8ta2QQfeHAQGVDB59UgmQczCd8P3aobgM9M9GR+cn2gUN
	aUKrWZtkV+pkw/jPqeu05WIVVsgahIe6VBS0WsnWJVdUIUjUixP+kaRbBDdn+MPqh7I07NYsjv3
	+tyLP/1wiynmnkSlVrGf6KU11SAUPfur3Atp9UP1P1PRpd7yURRA0pHg/zUS+mljrjeq7EeQOii
	j48yBqR/IpDOAc1AP8TWB4zAA8BxGjBhK27uulmh8PucPbNEauLh7kFtje4uszydgkBrgoSEwff
	57NOnsHe/bRQ2GTaRAGLm/Q==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3283605585a.4.1792055679495;
        Thu, 15 Oct 2026 02:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3283601285a.4.1792055678894;
        Thu, 15 Oct 2026 02:14:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab11d7bsm101640266b.83.2026.10.15.02.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:14:37 -0700 (PDT)
Message-ID: <8c375f13-ecd2-4ceb-8bc8-949a90f971fc@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:14:34 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: regulator: add Qualcomm LCDB regulator
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX8Gla5Vtl64Hj
 UQjTAiEU2rjWpHkq5DSvNwtxCc4e5ibxoZAOSnU8qHIFDs8SDERcnBKIYFVWZxcwm2oW1CR6sQT
 HKSTJYzvfU60/LJxetDaawDQwj9uQ44guVIbw/yEF+pyKvVcmNKKHcWwICDTKzVLb1nGsFMf3N6
 Nb/e5pCAqKlssRX5BLlFA3bV7XRYkO+Eso1VyCnviZogYuQvggDKWbDbTh4OmPzTQWt62A/R/Yk
 AYtLnPhGU3Te6Vsd6jmK31+J5hTD/P8tbCkAvu0PBA4RXI6kLiOkqX2WkyZRLl2zIWX5FoDZ76N
 6k8Wbj5w8/K9UnyZorcJNc/cSIjti89djRMGu/FrCjlc4SdDm94H7hJRXt7/Q/ecsVZjkVAeiST
 XCfv+nejpV/1jBqRSQRNERZtdE+4Yw43ud9NFLxcFLZ6Pl7lD/6QT2DHndObFAJ+LV2+cYx8cXA
 xl3A93hDZplI/82MTkw==
X-Proofpoint-GUID: VVrJWN46H2QFSNT_KyMQXH5RY1Mvi5oH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6P5TDIInN9gc
 DG1enFb+24oFF/M07sMhDIO+H0xCZTbvTG4PMr6PNNlX0jtbsyr09v7B4Z6JLSeIRrpcBJQg4nF
 hHQzq6MdGP/m9zbynko6G6E51cCtraI=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad09980 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OJYj8EsONSIZtexx7k8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: VVrJWN46H2QFSNT_KyMQXH5RY1Mvi5oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> Several Qualcomm PMICs have an LCDB block providing the positive and
> negative bias rails for LCD panels. It is not supported by Linux, so
> boards using it either model the rails as dummy fixed regulators and
> depend on the state left by the bootloader.
> 
> Describe the LCDB regulator present on the PM8150L. Use it as a fallback
> compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
> version of LCDB block, so it's not being covered.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +        lcdb@ec00 {
> +            compatible = "qcom,pm8150l-lcdb";
> +            reg = <0xec00>;
> +            interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
> +
> +            ldo {
> +                regulator-min-microvolt = <4000000>;
> +                regulator-max-microvolt = <6000000>;
> +            };
> +
> +            ncp {
> +                regulator-min-microvolt = <4000000>;
> +                regulator-max-microvolt = <6000000>;
> +            };

Let's tighten up the example to some specific voltage to reduce
room for poor copypastas

Konrad
