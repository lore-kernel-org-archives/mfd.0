Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FE644C502
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834191; cv=none; b=D2k3vV1IeHdV8/n7PXUYMdF+h9eyeKuaqeBCjxym7ffCrcEvJMMnamzEfMVzt6R6zd/5yG3LDNCFuoxl4DoYHvw5uN2/bmKt6SzU34/+IFK0hHmKUZo6Lq9anWKI11AfoO1eZaqNbGfb6vT125FztbQo2U1f8OXw29uXvpXn9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834191; c=relaxed/simple;
	bh=asxDQ6fQtq0+zoBrpTtg4hSVuljD7ouxIXdiKSHzxcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+HTgA1ajsdHBvFbgBAKDWFrNBQbGLXtIOJgm7c9Pre6OQNGY/pdsCV4u+PaeNe5BKe4csOYFJ3156730COg9iCYtQWBoNzk24XgpcV2GbyzJt/bDsOMHJh7nSy45Rw//+gkP0PAPVCjy1Ww+ybTRx1UqzOzK4LyQJ8UqYsNzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8YM4+5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxLJ6Fzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8YM4+5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxLJ6Fzg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm4he579066
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 19:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=; b=j8YM4+5/mxhtJZA/
	Fw7grVa5EXsQG9wnVw9HnY/SkxNvYuRc+KqREeqWrcAbdrgMwtgUlreKPlhKffSe
	QOdGt9Po7AW6PQhp2dL96ei7Wfqo4PvYz1j6CncO9SHhGeGCIM3m7tf8/KxI3BpU
	GvVrcq/FHHJPplYmVe9EvbkhfttV4pURzXDt0sSGGq4hbhEPKL0Pd+b3SSektTCI
	m+6T4DRiG7MV5i16v5NqXKGtPLT3+llMwFHZyCSHctzuPITLA6aCnzrDhKOc8W11
	JLn/W0OJcSzxD3Ex7XSd3M51TGMEGaXcJG55m404MdQ5QiDFkhTQEanX+ZorN+/p
	eubtxw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnua0ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 19:16:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso944706a12.3
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784834179; x=1785438979; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=;
        b=IxLJ6Fzg8z4GuKGLJDX7Zz8Ydbvi16sR+YcOevFRRNgTwtpLiC4A6ELGUGn47CeTiK
         qK2E4w5s/ZuhPpIWOIsWg/UK9g3AVms3r9dVY+TIiRSi68urkuJx/ubPgZF+z+GLHSC+
         sIUgOB2yYvd8IjYtZ9vIm98YGMCwwupi9nZNVgROdufe6vtjVLPZu8Mfbn+xfPBPsLL4
         snkAAdK1cj+WIvxFtC4OoMsylilO2nr000zyERuXdbUQJmnoVJcYOE4Tisdo4VFqHjOA
         wGWzIY6pI0cHHTohIXLI+Jmp/nsc/Zyn20UdGG8TeUv8DcbITEZgO7JgJhi0VQVTZu8A
         Upbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834179; x=1785438979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=;
        b=Yq9uHPXWXsqamQ+tjssmSwzRoYawK5A9MvpWC2BTmVmt4lsBGZwlbT0NzVdTG4Z27j
         69i9zJFlbrGnDY2CaewAzIl4iO/RpEylwN1P8taoQKRNPJ2E6GYKwY/E7HxptrZcLg9b
         kDMwzK8FIfGaGpnZ0kek2cfMU0cencnEv6VpOSyq8jofN0ujwGmZZMm2MXutHg37oRSp
         PdVLST4BW/30fAVYhey0wf4aBvCzH2enyrlYt6m2BNr8bmzfSg9N0g9CJhLpmmCCaz53
         d8SeYtRmKHXmAVVPh1kk0ZAaCIMuKWYQiXLHi/IUZMsGash5SivZR9Vhbe967E6FJuYx
         l9yQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjIAcHgK0V2crHT7yAMnvw42gt44Axo8L8lCrLP7qA/9zgKyhnZy0ZPfhkl+seZrwhE/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIF7mdKnnQEPTcQw8eNidSDeizE/1HsjEwU0Kvc/8GkXXq4QFH
	6wG7+WTLfS3JZDgf5YiuPQcet5SadzKleYyT+RLz2Wltas0nOja+W6P4Sgjw9OmUoHKd+WNvMXx
	LNcMd0o0PexZsDNo4T8OEM8WmGJXOTBUKa7gEh6hTFFFx4EPaNshqtmc=
X-Gm-Gg: AR+sD110EL6JDaNACb4s6sOJjqQN0rGV2/ACfmbC7e96D7Ixf76Lm+XxsnYXoW9pDRt
	iBq6m8yCG4L7RF6d5o2iwpWN6ZytoDYZQSuZUDRvO6sAgri5wJ6VszamHxsWlN+NEhoCViTOK/0
	X99Eo382T0957FE55k0F7bz38m9s6aUwdVNYTHWFhFhwtU4u29g6Av4w7q9ztdtW/WtBV5tO9Lc
	BDQWpxhK7hJ3ZZ0ppr4vtk9ymonbq98QFQrJr9y60TA1mHzJ2qwRwK/NafSJY/RIfdYYO9Xvmi+
	hGBeWQKQtkJut+JR+9Htds3AEiA5ACHD2KuIIPjoPBcH9uTl64D4bSJKsOTssUIejLtI7lcjy9J
	2/GOogS0/84jk2f6w/I+zTNkqYWJKgob+
X-Received: by 2002:a05:6a21:103:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c44b02ea57mr4433548637.32.1784834178839;
        Thu, 23 Jul 2026 12:16:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c44b02ea57mr4433501637.32.1784834178262;
        Thu, 23 Jul 2026 12:16:18 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22149978eec.20.2026.07.23.12.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 12:16:17 -0700 (PDT)
Message-ID: <c1db2ca4-ad1c-440f-bff8-eb7660af8021@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 00:46:11 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
 <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wT03XGImJy0KlcOw-rCFT8t_XpkwEjTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NyBTYWx0ZWRfXym5NTntUgekq
 tlOLT9oDwGk0HsR1093+ZSpNZ/9hPU2YUk7g9CDZOM+zSUBvlQyirKVulemwdTYC1LihCxl3zzX
 eUTQoFjOnjej6zydwEfy09hk7ArKmJbT1E+40XSAdti26DNHAA55WWQGeGo94HyrALFrh1wKeJW
 gjQjBpXL3xIfbQaupNfaTe7n8NPPv2YAHGPu9AwapTMm/nrR1wTvQhvwUd2fAlY7WpwMmGp2GFN
 RTUblaSPWTSbrWr7al9Qb8aJ31zUX6NhS+bZ6dXiGySLJ73kXGFhI2oxDdqCHZvre63O+k4rmFz
 EeAW1G8/DIkpyek3bVHoeLzQjqJULA4QKJi/HUw5D/TmkoQQEa0/5lVKRedk5KDC0zrkBJmUkbP
 ZWePDMvA4fWzCRiHbZApp7EYkDkdkxldkIh1LMs9IRft6ZWdquSWRoHYAfNtw41cz1AAQXECTyk
 g2V83hq4k6X65PSZEhg==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a626884 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=l_Mds-CbMwRO_PrwST4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NyBTYWx0ZWRfX7kpkFVPQAs6/
 ycKuzGnd2VSf9029WUGn2il0IHvSGQr1f8vmAOYVaWZMf+1VET9DFZE+g/jUQVFHwHP07Jw+kP6
 MzDRoMR1ekE9B93ZNMyxZuEyl9uwshs=
X-Proofpoint-GUID: wT03XGImJy0KlcOw-rCFT8t_XpkwEjTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230187

Hi Guenter,

On 7/23/2026 12:29 AM, Guenter Roeck wrote:
> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Guenter,
>>
>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>> ...
>>>>>
>>>>> I am curious: Why not use static initialization and use the is_visible
>>>>> function to determine if an attribute is visible or not ?
>>>>
>>>> ACK. There is already a comment in v1 suggesting the use of dynamic 
>>>> allocation based on the available attributes rather than static 
>>>> initialization. The intent is to avoid having to perform enable flag 
>>>> checks in multiple places.
>>>> . >
>>>
>>> You lost me, sorry. There is only a single is_visible function,
>>> and its intent is exactly to handle situations where some sensors
>>> are not always available.
>>>
>>> What would be those "multiple places" ?
>>
>> Understood, thanks for the clarification. I'll revert to static 
>> attribute initialization in the next revision and use is_visible() to 
>> control attribute visibility where needed.
>>
>>>
>>>>>  From the earlier exchange I had the impression that there is a large
>>>>> number of current and voltage channels, but it looks like there is 
>>>>> only
>>>>> one each. That doesn't really warrant or need all this dynamic code
>>>>
>>>> Yes, this hardware only supports one or two channels (voltage and 
>>>> current). What we discussed earlier was that each channel can have 
>>>> up to three threshold alarms (warning, critical, and emergency). 
>>>> However, the hwmon framework currently supports only two limit 
>>>> alarms for these sensor types. I have not added support for the 
>>>> third alarm threshold in this series to keep the initial driver 
>>>> support aligned with the existing hwmon capabilities. Once the basic 
>>>> driver support is accepted, I can queue a follow-up series to add 
>>>> support for the third limit alarm.
>>>>
>>>
>>> What does that have to do with attribute visibility ?
>>
>> I was only clarifying that the channel count has always been small 
>> (maximum of two channels) and has not changed since v1. The earlier 
>> discussion was primarily around the limit alarm attributes. That said, 
>> you're right that this is unrelated to attribute visibility.
>>
> 
> Feel free to use (and test)
> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- 
> linux@roeck-us.net/T/#u

Thanks for working on this. I'll use that change as the base, rebase my 
series on top of it, and add support for the third alarm level.
By the way, for the voltage channel, the hardware monitors undervoltage 
conditions and provides three threshold levels. At the moment, I am mapping:

LVL0 → min
LVL1 → lcrit

For LVL2, would it be possible to introduce a corresponding low-voltage 
emergency threshold, such as lemergency (or another more appropriate 
name), to represent the third alarm level for voltage sensors ?

Thanks,
Manaf

> 
> Guenter
> 

