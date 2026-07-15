Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E342BC4B
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119012; cv=none; b=sGpUL13cbaIj5Ne+c1fsNLt4ULnLU0iSepoWDa89durXPHhqTR9I79WwLvSSSjv56ntojLcTvAiCZRB6xGSKXhotkQDgW96YV/boEX5YIhlpWOEigTxZgyJKnvcKahLr+HtIbxCSleJumTQr5t4FZQsLFMf19CXfxjY/yYczTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119012; c=relaxed/simple;
	bh=hjvVC7CVaTfy2PncDfkDrgy7powP35HIB9c/DaIkc8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJ0+gaPyzTAy57LgWDOlaI2fm5hADLRRos9s5puyMRMjX+losiKgNszIaaYNqJpLgUT1n4El5tu81GS7NMhZ1AHWQzqfECeKImMreVkzgF3sAURt8UHLiFrf2rJgm2OShq4MQTaxwHIXdZXhs9ozTooErjIrtXarV2fB1k2JmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTgWXq/O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WN/Nu4oj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTgWXq/O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WN/Nu4oj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdro53601156
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 12:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajU1XKkI1sZ96O9t2VwfoWy/XtKogCNLhpo+YWNMjgA=; b=hTgWXq/OM8o2BInt
	ebG+XSDhV78KD+Rv926AuY/7Z4cSYaTTiDCdF5UfA1viAWBKm49HsrUf/gwvBmzn
	dYMHRRZjrRzRiw+u6YelOXmL7XyJXFStidBRV9SXtTm1YfvFIrLZ2RzLDWZam2Kk
	sUXz5jh1j6imtBWPNXVq77T3roU9CqYqshw1FWGTxgR9FOv1VO7uZnf1lGqrNXtN
	HorCtdMJrjGFF+GvXcOQpLnMB0ZpnyYD5zjNjFyvMtBoQclI5H76bT7kJNfiDYl+
	iQLVmdSzhOFO4fDlrEPYJ0eEJA7zwygyDMETyF3vBEZ9+Y6rtKPfbIYzSmW6i9bA
	KlKKrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60nsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 12:36:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2da7191fso484368a91.2
        for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784119008; x=1784723808; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajU1XKkI1sZ96O9t2VwfoWy/XtKogCNLhpo+YWNMjgA=;
        b=WN/Nu4oj9VeeN5rTnBE9J4s1DPtj5cqOP8cGUxJ8zt61Hk4mtGkqGYVZ57GLM2cgkl
         xIoDW+Sl6GVAEq9fgrgIQf4PlgFf6SMgtW/XMyxJl1Thc9qgCGTnOx3msom/wRIhWORn
         NUdHO7j356EPRutLo1dgiz4iCJCjS7+zULC5y5Gj2TmpLuiAa7pL576HHdtwd2p4GcFP
         kdWI44YoOTHnyKfb8wn0K+ycr9iADi+Qrb7ac2eWohtsL3Xo8aytJUX8yokJmAzLfC5r
         7uVxZFcaWKUtRgTFypMCrcI3ul+2ETElYzLZ46ghv9IMrlZuxi0i/v5TsK2fhoxbsNFW
         KO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119008; x=1784723808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajU1XKkI1sZ96O9t2VwfoWy/XtKogCNLhpo+YWNMjgA=;
        b=GdIG9dFwZrayHg+OUGDY7MuLrUufUr3bW69MdJa1zSrnzeO5rQg0Y+tJ0Pj5JkS42I
         nCGQWM2bgw8N9GtSkZ7L8qmM8XK+hXVRoNabmSuGYiakbFFEIENSF/mWj/Nqo4qkrw3/
         76i1heAfNxExUYp0EhgmByvRHvyhA36MljwI8KVwImz5tchUtQtGDKXYJeT22nvw3tC4
         aQEAW/Rct3FbnYNmjgICAJKw5UcWaIjKddxlw7v562BXIkZESNzpOUTjJ7kLBQUA/5KS
         AJAv3oo+paJtZ2jWBDlj8Lr7yhDvbEcSMyfgK4T+WiXj4eKyKaj6MxQQxwLaV4gQby3b
         XH3g==
X-Forwarded-Encrypted: i=1; AHgh+RqUZjfJ+16yhqGiSMPaAfORJMmdnHz9DdfIfGwR3tsS2pEvYuxsEfAMPrCV+XIq3GYYTA8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO4aE1kBCvTQZveNuquUGc54Rj9sOXaoaSa6T85TGajsgO4SCk
	I4eW6V1eEhr++aDCo5fWRgDvCLTOVUgDOZzpYx5OZ8gEh2R3lRxRY9a0wTbmLdDh3pZ4p8MZhEZ
	OjSv+WCyv6b3MLIU0Z2M6jFFfUCMXDqCtxDfAgJiJNekQs7fBrUcBgew=
X-Gm-Gg: AfdE7cmEsJ+o5MPFIimK0+ET1ixKFO8kuozm7YI7rvrsE+3IIYHFipR0Ol4y3tx98FX
	M3+gbikWOuKi/9ISWSSfs8SnR/0lhX7IUN3aEBhp2Iaox30xGNye2OtyFmwgJKRHeIRqareSD6h
	fMPyIjlfnZW8iHArqR0hXcvnZbgE+vfWagX8Y2ckk0xhNxQyKRdv6vbvozyq8vqzxGmC78Uov49
	OE4+5CvqTmeXrAiQUvabSLtC1ckSoQkLtryHxNONkvX+wxt8ck66Fjsn7rGMIne6Y500K8kqcKF
	CysKtwlecRRvERDfgWus/gXZw4C9lJMgI921b68P58N7CwLOk5kX31WqRrBUO5ENP0TWO8+ErYk
	o24mWHMOYm2PAcIgWFJ5MvOrKfD4NXIJrQ41r36T5cEaLpQ==
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr15134101a91.7.1784119007513;
        Wed, 15 Jul 2026 05:36:47 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr15134018a91.7.1784119005125;
        Wed, 15 Jul 2026 05:36:45 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e530689sm1491453eec.10.2026.07.15.05.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:36:44 -0700 (PDT)
Message-ID: <f06056eb-e7ef-40ef-8840-bf4d5d3d5f91@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:06:41 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
 <20260714173004.447F91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260714173004.447F91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfXwSeES9CEx8ke
 qnL/26mJ79AEScXmD57qdvWqL6aoG1ScnLZf26CJqy6rnAj3gcY128gqSrK4m8Zze1FkVoqm3Yj
 us33inUE6YP9Zmp6Sc2z8FtmBWNFgXU=
X-Proofpoint-ORIG-GUID: fyfnXbYrQ93MC0MLTHkSQMHSFNArY6pB
X-Proofpoint-GUID: fyfnXbYrQ93MC0MLTHkSQMHSFNArY6pB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfX7/C5qCaYj1eO
 YBxf6QJAZzmft5jRTgWCqjnyzf/9Eh5C/sD44TfdebindZ3Ab/0CUHs8gyR3lX6Eg5IKUc5p+sA
 T6fSMe2P7t/3ZZLGwg+4Eqf2Z4cQmuOSw1MllUXFtGfKncQbNdJDQfSGp30VVS1fBbUZx1RXR4c
 1R376pfGETMncj19CDDzWe88+y08i2wV1vvic5L5zSw9yUKK5xFnYgzC4HHkzAslKiuTKH+xIyk
 pa1pNpmDZUBEXMQZ9nGeae095Rvw8tpOFEbY2YZxULttssqgQ7acskGGoEUi0GjpVuN+aANoZ9f
 JXMyJHtitQXIzkM88IDyulptwlGKUGX8AT4vfbj6OEIjtnpvlfm+kD3YNvoutZo98Gdg//desCT
 HhK/sejE+oz2kzIoWioPmrRsg0y+b9szSRC7gHkVZ4g2Iy7DlJ1Up3o9Ly3l9Oq0xXbJ2rL5Upw
 1piEVVo00Eujdr+/DyQ==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a577ee0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v0XS7ZgMM5NP2KeBKikA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150125



On 14-07-2026 23:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Strict enforcement of `named_fwnode` aborts the entire MFD probe if the node is missing.
> --
> 
> --- Patch [8]: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD cells ---
> commit c957d9fd3d002c62018221b0f97f57bad5c0b519
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> mfd: core: Add firmware-node support to MFD cells
> 
> This commit extends struct mfd_cell with a named firmware-node field to allow
> registering a child device using an explicit firmware node. It uses this as a
> fallback when no firmware node is assigned by device tree, ACPI, or software
> matching.
> 
>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>> index 7aa32b90cf1eb..ba9682ead2cad 100644
>> --- a/drivers/mfd/mfd-core.c
>> +++ b/drivers/mfd/mfd-core.c
> [ ... ]
>> @@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
>>   
>>   	mfd_acpi_add_device(cell, pdev);
>>   
>> +	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
>> +	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {
>> +		struct device_node *named_np;
>> +
>> +		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
>> +		if (!fwnode) {
>> +			ret = -ENODEV;
>> +			goto fail_alias;
>> +		}
> 
> [Severity: High]
> Will this strict enforcement cause the entire MFD parent probe to fail if an
> optional child node is missing?
> 
> Unlike the permissive of_compatible match that merely warns and bypasses
> missing nodes, returning -ENODEV here cascades up to mfd_add_devices(). This
> causes a failure that unwinds all active child devices and blocks the parent
> driver's probe.
> 
> Should a missing named firmware node be treated less strictly so it doesn't
> disable unrelated MFD functions?

We can allow probe to continue if the named_fwnode is not found. Will 
wait for some more reviews around this.

thanks,
Shivendra
