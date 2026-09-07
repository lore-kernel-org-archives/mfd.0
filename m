Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63A46D09D
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778622; cv=none; b=tf23zEZvbSsnTamDEhw/jbu0zdAXfDH4+hHUbY9kinDVCZFCSgun1NnOlZTh8bSXapnC2bG6csGmlpOBEAV+KuxCdDuXNGWZSfLE0cSytpLgM37a6gyJu+vwCYRanpcSPfNCWZRCJcUsWd2En+92pOk+4c0blxvGRERTfmoE72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778622; c=relaxed/simple;
	bh=v1gOmgndgVwqDZV5PtIH26ja5YsrzDRqZskTemBCXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbg640OOkSv6/jAbtjUKLMuQEbm51At7i6d2JdO9++Ry35yfTi5fWxjGEzUeh+AMKdg4GMRBqIxHkinN0izUD/I8I1YkjZOe0KmR7z7e4m7osb8Je3jZGFmqRN94cvTqMkmxS8lPXvQb7dpzLBHR6a9uZPcvIHAiondsIFSEoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMDs+HB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/2H6fSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMDs+HB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/2H6fSa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An5ns3862529
	for <mfd@lists.linux.dev>; Mon, 7 Sep 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=; b=SMDs+HB5G3BJ4Haf
	jEPFDlTrUrnXF7BWyrIGYFivDdaud7fvIL7+z8AlFDabEKQyYfBu4fSNhq4yl1nZ
	EIOtEI/8q3+7EZjsLZEF3j2Z03Ahc03OhfzaQ51c1UU3czOPrtrOdnj8ekouxUeC
	jPLaA62Vlyo1Nbg98zcUOiGEKCDXdxY94gfO/FxubMzhIZKCUbNWJRdYe3RmJzzI
	2TTJEgShVm9J5zEjKcCcjtb6jSA7lGelod47u9n9QHQB6mHPHM0x6urthO99O8oy
	YhC4FGmDDfOf7c1BqNP+efAqqqluBIu65b0AeBM+P8Me5n/AiHI0Py2+XWNiFWKp
	SgCE+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hfe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 10:56:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so349563a12.2
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778618; x=1789383418; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=e/2H6fSaQPH1+XR2m0SGYxqqQeKyh8W8YZQSGFxRj5bKGbxNNDzsZ5McAXiE8hpgLe
         kZnT+3f1koPRP8yAUUN2WPS1fEoPxtp0oCMDCMfSEklrAjyG9dHUcr+9VC2Bte8pQhA1
         rsgEe5gJP0XdvW75R9IghFuvWaNP/NY8KOJIesCO5a04u2TnzaTvzWmwAq1wAt1uT5cW
         XtN3yzZYldd3YAE+Nia21L86oq2YxdwGv8N0J7uKRAlhOjKyQt1CmTYRJxBaWs4RNHZ5
         TwHomRuMQMzCkiqlP5YltgoKa6JdMHiYypX1/eihmoGFmLHXnm3TTHaGJfK7afdEy7Hi
         Qd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778618; x=1789383418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=V49ct7YGcPfoprlkhv1apn9eFw/qOHilYSDhoPHmzfGhJ2OUju98MLh2bmuZV6ppxY
         ZKgpHny8S3r2Ca034Rtp7Ikwk0XNNNlawoLi44CaYqg9Wzs3J3seY7+49sb3UCeT1Frr
         UgBsWJfIBz0GPN0eBs0gqFX43c6xlcrawktCsz0Xz6CRejiOl2om50wsyQQYanUO/ZfR
         PDmc+0ihinWGTlA9gnUwh3KCLSR9ar5RZzLWKX0IY7/ZY7oCVb6nAW7jXLNoAE4Uir3D
         iPOaGi9vfTgGqBHhbGycpdi5AYmSGfpbIKzExmt74YIXntM1NqZ+ZJnEiTfAAYa18UrU
         otkA==
X-Forwarded-Encrypted: i=1; AKwUvBxYLZ8jp0mfFgOwES11L6ZnUeBS8LHnVt78BPPXGstMYoPh41rWsNxbsTNTuRhzH5T92Ow=@lists.linux.dev
X-Gm-Message-State: AFuF++ncRop24nMHbehgGF//GpJmObL78kmX6IEKDojJlIL6eOZEygaV
	mmHh+EnCq+xBdyWaOxMkB5OIDktfNrFwe+kwoebtLlwxEdfPP0wziCa1LuMaz4Tbq5j7ucpTGD3
	kAYb5Vw3jutP5J7XnDy2eZk3A3zO1Rs7lbJkEJuiai27BLZ5h1T9W6Y8=
X-Gm-Gg: AYBFou26sy8709sw78GE022q8XEyvNsfa+86G2abAQUCth1OAJM8FX6F9TcbzR292Z/
	RsgfVnpKQz2TvHLvC/UdPNGc4O1Ddml0tDNflcqGPwH2EgQWqj668xJ3sJD80Q1iGH/hdJAQvUv
	WHaXk8GjJMkR/A/CWldr8o6XW6eAQsZNt6PumclkZBNIEW8Axh3KS3SsvDFXU3O6UIP2E/nN3Mq
	nvRneArdIml3tUUlBx7oG5D49aBx69PJp0+JUz2gMkp59G+kdCnJWAmyGsYfYwiLEyeKp6tbGP6
	YoR0JvYYqj7ao7vAzloa7JVSxqy77VEdY8ijWcWfdA3e/ELZogrVqJKReYFeBjHQKM7ZRAdRKAH
	ce1UHDaNvTt5DESNEMDe830xrVBa5BR2A7V5AZ4T7CSa75aqEcapJxTfaSybVEDgCU/wqoDJ7Qn
	/04W09xBIpDQFxgGFp6Q==
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977283a91.16.1788778617630;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977214a91.16.1788778617136;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm30014762eec.2.2026.09.07.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:56:56 -0700 (PDT)
Message-ID: <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:26:48 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e987a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FCQm1kSmxEXMnWVgeMgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: yOfmOwr_fWmXZIGrPQLwYVA7lkEvswya
X-Proofpoint-ORIG-GUID: yOfmOwr_fWmXZIGrPQLwYVA7lkEvswya
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX/tWgRR88eQgK
 YPAomjrFdckM9jONkMzTQQQ7toOGGdMLFt1mUuCqW9GVNbsUiiA3RAjHsbFUBrYFPuvj0f0roYQ
 puM947p4MO1U6A7aqpil8BWKejkB4fg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfXyUS8jy96bjdN
 0q9V9uc79c3NU1awhgBABCR6Qn3jMe/Ui0RLS/mwUklIfD9hjgkgG96syH+eWAZa0Lw15c2qm+3
 294VbzmJEhDmmMontFVEXmM/3BxePC3bcoPzkKvx0SWCk8NUY1I7ECsobu2ALlz46nl33YgNNSP
 U/JsxPjarYtYl4h11TVvp4BspmkcKOV1ZvY81jNcYd+0LwDGNmd9zBX9DErpD6yGB88L1/03kxt
 2Ho12NvSKgMY/1vIHEYnnTKJsjm3o7xkkkZqutIO8sqs8QENoDt2FUuC0TCsqZ+Pc90XDJxrepD
 FmJ69wElXvU56Uf/0uKp+oHMpNxI/dmP2ciHT+K/AsMNIhROJoZoVs44NTB+tkg0qpH6EdlouVT
 yv2t0NI4gs95WDAV7iArPCVAlcgkcH53VHNcduSjfKV3psUnUKGvsLJ9nbxHq1tuDDmSa4zzxnq
 sZZ9JUX8GuoYHazp3Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070120

On 9/7/2026 1:43 PM, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml

There is no such file as qcom,x1e80100-csi2-phy.yaml,
Same was pointed out earlier on another patch,
https://lore.kernel.org/all/20260722-literate-nondescript-seagull-cbdfaa@quoll/

> @@ -16,7 +16,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>  
>    reg:
>      maxItems: 1
> 
