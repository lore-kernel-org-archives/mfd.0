Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8738548035A
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158662; cv=none; b=LSSTe7tphg/X2JVkccWdhvO4iokTutqbTDZqK741ZtDpms3zltuebGGlq5hHl+/x0qTAKQqZORv2Kw7g4DCVm/ut9yC9gVIQ9HE3zXgPSrtqyc+9sPfmMKSMVjEnSW00eBDFCoChzi6SZuSCapvbnDOyw6RmlNP3P/HtPV4ZqWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158662; c=relaxed/simple;
	bh=Cpd9CUfAbQydr+/IWp35YEM2rThT3kvF1eNAivlA27Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZWBbqofgGBUj+zkcykLjZdXXc1TPVQzy2aPgpdLEPalaXLd+QxB7ZbJ7iVghRxvYHv35nllFF0H2Ik40o4MTc/WSF0aRKBRihvaARbZ18ycfoAlpYb9/hMdo7M/TUNkfMsAy1rSXWf4gnqkIeI6+dV9ImbaGEzqiZjAKWOfgCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GstYEKl6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO7n22Rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GstYEKl6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LO7n22Rg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3JsR3566257
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CkYoHcJPz+rso7SJkc9SF8LO31/cRTOGFpw9v5udueA=; b=GstYEKl6e7NVVYY/
	vDZMKaqplJZJUpuhDcZFPcVsn98JNSCcXJQ+yzXcC10FA+aD2l0ljinl4rWoxBg7
	O9d6zz5P8w73JjZL9R7tTRFhsaWR/l6YJ/3IG+VbSnZGfkLsywJgCZ7bN9ViBndn
	ZLvYNQCH5iKZg3stQtfGkf1DO6Sdi7OJemNLgghkyHX1jhxDrWNQ79+GQROUveoz
	zGPWM4oMCuOUFWfLgHkBagUmP00kIcvSFQCOCdZQtUwkf3vVHNWxtzONGxuQjsQM
	0ARkpPe18yWd7vg7WN0EkPz5dRjjmND+jBLkgs1BGKC9DvY48Pf+bD0VYhJuD+Q9
	Gv39eQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuuew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32850005b6bso902910eec.0
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158649; x=1790763449; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkYoHcJPz+rso7SJkc9SF8LO31/cRTOGFpw9v5udueA=;
        b=LO7n22Rg8XJf9ff2fL/nAwZwy84snqvBkyT5rlJVsIbWVRiP26DHrxb0wbo6K3t1Pz
         LuLuepCvwtLGN7BhyFoUJhPPLzzPfQAwrqmfq46+77pRO+jg5BV/q24UJfZAsUGeW8SW
         ydNJS+xsy8TNjartJIJrQP5TSZOvkGrLZrv7oYpVXxPvwtWNIVuAZ77UUgD5FSucXRr6
         g8HQrLkmjAj9SwZ6zvJYBNOjlWjjXjm+rdASWTGB2mpeELEO+5iYXuJwVAhYF0KaxIPQ
         SAO76iDv6tiYtMSnX/Z5Dr6G4vttlV+sHdqAQ7We2GSUOPUmpGxsn9jKBAt0kP7wKyTP
         8oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158649; x=1790763449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkYoHcJPz+rso7SJkc9SF8LO31/cRTOGFpw9v5udueA=;
        b=hKH+1VKxsm0d4qel9GHHuMcGQUetXtNWHiDDjFycnZSvdOx8ouSc2caNuoFcOE91jJ
         4Z0vOj241A+F9jpWHX14OL3JQemydahhMvArDkorbB46cI9ZkBxl7114ISKOyyfqKI08
         wEG9/iBcHQlUZ9d9IPr9h53B+Dm37p/CpE66lLN+NCvLdjmKQYM2Wjs0f7uWLEttonkr
         zAWfqFI+wSyFMmAwWbbDluMFtWKdVctIJMdR7EFsEVmie2hNH000HLw5Of5/NsbZtgkG
         J1oYENC0D26H7M58fh5Mtf48elCP1bb22ZzyEd+V/9a28Pj3nvPcRqoG+JLqgz7ALyjw
         gxjg==
X-Forwarded-Encrypted: i=1; AKwUvBx0LG7hvQcSW+Lw+X80dzFI/SqsmySqi5zE+4/C0jeNyol1/ttF+/atCzUoMSkHqyuY8b8=@lists.linux.dev
X-Gm-Message-State: AFuF++nH2lL92rIqpVKESwPh4YrtO7SCirD8QIX3D2zwQggQ6nH/ilqz
	a/brKWB0RKUoAZSJwbvuVETd44mQsH/WZtCjBh9Hp/PbPMJ1qh6i7Qop0zZ9hac9K3m3W3V9f0f
	AJ56tzQHDmembnP/CRTL/yFHjXGna6KlD+ngpzVmSRMGS++w00mz4Dfc=
X-Gm-Gg: AYBFou28V6Rhq2zHyuKX+x64DwjfJ0NpWRos7J7faJ7U9NhIZTeRkcy+wRaXYakZc/W
	ImEf++QE69uU8gES/9riuGpwulEo5+WaKwMMBLJVw/BiSmGcDeUgSanugUTqOmqH++NoOEHisM3
	btf9Zo1NfiuokBTh3dE7x1Ol1rCEJL77eOGK4mALwMluwN/mrmotCYlDw6AC9eKU6uhc97dMnbs
	7a7jawAcF+AO5vkg7cYhAIjRtJL+vEF1EQ1q7GXe1/GFhfqQwKLJWs0JN7xfS/s1LKbMHYrBqOk
	ia3vbPFadOrYB9mZV6MB5JtXziqKYsis23MAevaPC6l+z1auGcVhP/38g3w/GrVtU1pAWvwmJqi
	qaJC30sDo8pUobCJzIsUR0r4OWWGu
X-Received: by 2002:a05:7300:b2a6:b0:33b:afc9:caa9 with SMTP id 5a478bee46e88-33e8e2b7ddfmr2231485eec.38.1790158648938;
        Wed, 23 Sep 2026 03:17:28 -0700 (PDT)
X-Received: by 2002:a05:7300:b2a6:b0:33b:afc9:caa9 with SMTP id 5a478bee46e88-33e8e2b7ddfmr2231455eec.38.1790158648295;
        Wed, 23 Sep 2026 03:17:28 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:27 -0700 (PDT)
Message-ID: <ee9c9173-96ac-4507-8b42-3cd12898bdbe@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:18 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
To: Lee Jones <lee@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com>
 <20260922093327.GA2308615@google.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260922093327.GA2308615@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VDwqh8bsB_y6Fdc2xUEjJwQQL5U9Q3Aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX2KutdRkgorZd
 JDb9y0TxanfW4MKWhPrsZz+P/7aFm6/ErH7T6zG+LTazTW/udbeVGJ2BZLSAaGR0RS+e91SNUm9
 9G2BnjbEawXKbQ2wW7GkWhrniEOOpU9zXOTQhsBXcrfhyF7X10J6BYvPS4l+tpyLb9WLO3qUCwC
 k7L84QrTuk9+paUv7KWxTimARt6Yd+JMrK2FnvKxEV0MwZz+ytXFXmhoYxmusqauECacGNKS7dX
 NkbE+snGFQ4oSSynoHi23eV8d59SmllU08sKxK+HKCRvZlgKXmjsIf1Knhouoj5Q0IRT3ZICcJq
 t7NHUYkMrCAaeuPpOOH8WkwB8Tp1/igSnAOQqNYNcwvXTCp+qnUYu76PM09+aBc1ofTna+NbnoS
 meB9cyBE3YvTjbfzMtciRXYDcYzElFovfNBV+tQeFSb3Sj5lBK2v0yQwEKwUg8BchWLJARF4ZHT
 /nmtghNh+ox8mHLP2rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX5DExZ8CcSDB3
 eXkxIGG4eGiyWr7Hj1+Xr/6rhJo/etO9oT7xiAPSFjd+QqcwxLAMK6I9Ot6UorfyvFy0YSobHaQ
 BvDnDozIfIGRZzp1hNZApHrIuhvktp0=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a73a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pTjQE-TItn96KZd9_6QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: VDwqh8bsB_y6Fdc2xUEjJwQQL5U9Q3Aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/22/2026 3:03 PM, Lee Jones wrote:
> On Mon, 07 Sep 2026, Nihal Kumar Gupta wrote:
> 
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> The PM8010 is a variant of the PM8008 PMIC with a slightly different
>> IRQ layout and MFD cells. Introduce per-variant match data (IRQ chip
>> descriptor and MFD cells) selected via the new "qcom,pm8010-i2c"
>> compatible string, and support probing without an interrupt line by
>> falling back to a reduced set of MFD cells when the client has no IRQ
>> assigned.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Who are all of these people?
> 
> Did they all work on this?  If so, where are their Co-developed-bys?
> 

Hi Lee,

I had split out the PM8010 support into a separate series, which you
have now commented on:
https://lore.kernel.org/all/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com/.

I missed mentioning it earlier in the mail threads on this series,
sorry about that.

I have fixed up the attributions in that series. I have also noted
your comments on this patch and I'll address them in the next version
of the above series.

>> ---
>>  drivers/mfd/qcom-pm8008.c | 140 ++++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 112 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 60204cc9a2dc60cc1fe1b64030f5d803100e7874..28532cef7908ef3409a3dfc0779aae3b1a3885b9 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
>> @@ -34,6 +34,7 @@ enum {
>>  	PM8008_GPIO1,
>>  	PM8008_GPIO2,
>>  	PM8008_NUM_PERIPHS,
>> +	PM8010_NUM_PERIPHS = 2,

....

>>  
>>  static const struct mfd_cell pm8008_cells[] = {
>>  	MFD_CELL_NAME("pm8008-regulator"),
>> -	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
>> +	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
> 
> Why is this cell being renamed from 'qpnp-temp-alarm' to 'spmi-temp-alarm'?
> There is no mention of this change in the commit log, and if intentional, it
> should be submitted in its own separate patch.

This was incorrect, it is not done in the separate PM8010
series I have sent the most recently.

> 
>>  	MFD_CELL_NAME("pm8008-gpio"),
>>  };
>>  
>> +static const struct mfd_cell pm8010_cells[] = {
>> +	MFD_CELL_NAME("pm8010-regulator"),
>> +	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
>> +	MFD_CELL_NAME("pm8008-gpio"),
>> +};
>> +

...

>>  
>> +static const struct pm8008_match_data pm8008_data = {
>> +	.irq_chip_desc = &pm8008_irq_chip,
>> +	.mfd_cells = pm8008_cells,
>> +	.no_irq_mfd_cells = pm8008_no_irq_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8008_cells),
>> +	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells),
>> +};
>> +
>> +static const struct pm8008_match_data pm8010_data = {
>> +	.irq_chip_desc = &pm8010_irq_chip,
>> +	.mfd_cells = pm8010_cells,
>> +	.no_irq_mfd_cells = pm8010_no_irq_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8010_cells),
>> +	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells),
>> +};
>> +
>>  static const struct of_device_id pm8008_match[] = {
>> -	{ .compatible = "qcom,pm8008", },
>> +	{ .compatible = "qcom,pm8008", .data = &pm8008_data },
>> +	{ .compatible = "qcom,pm8010-i2c", .data = &pm8010_data },
> 
> We do not allow data from one registration mechanism (MFD) to be piped through
> another (OF).  Please pass through an enum identifier instead and select the
> cells and IRQ chip in a 'switch()' statement?  Also, why does this compatible
> carry an '-i2c' suffix when the existing device is just "qcom,pm8008"?

Yes, I'll use this method here in the next patch series.

We use "qcom,pm8010-i2c" here instead of "qcom,pm8010" because
"qcom,pm8010" is already used for PM8010 over SPMI in
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml.

It is also mentioned in this patch in the latest series:
https://lore.kernel.org/all/20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com/.

Thanks,
Jishnu

> 
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(of, pm8008_match);
>>
>> -- 
>> 2.34.1
>>
> 

