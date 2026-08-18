Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0532A3290A6
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031875; cv=none; b=CEE5UW16H9qVjsWLnqzHIPXlnlOI/MhZGyVy4NX7bZEofLyZSoH6z13t/qT4bUzERdZYR1MZtyzyC2zkIOfr68QRGTWa4XrndPlDAII+8OwMuyUb5GukQ13gh558/FpfdzQ0JukLVu5Fs6P2mMQ4ihYr9nQJaQLYIovyjx/93f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031875; c=relaxed/simple;
	bh=sHE07R+E3ock5k80GQbOzo7oDqEzd7hmLX9F51ZOOTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXZL2WGkVLcDfoZIu4N6batPArXm38oBnslaejc6WBHOORmS1IyfK4YF6IZcOLGu+fssRwZrpFlSJxLKTT0+l85UIbhRqkr8K6Tdkn4wuqQv1oGt2Ij1bpSTN3zIsUyEbWM1YXSe7J3JYUsfetde8pf3hy7/XBQjB9UbF0Plw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdB/aI7g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8q9uhl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdB/aI7g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8q9uhl7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3rFG3478601
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 05:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=; b=MdB/aI7g6QOpoB7e
	XQ8yNtedTszSMN80FoDCnb7nzxWD/v4NxGfy3NpSMA5Cww2bz8x7C3oKErZq9zdT
	Y3WooUHeVCEmD8oy7ifT00mCoUpvQZMmouRctZGKWrxg66I/DB1KjYWrRo2M5B79
	S/TaPRBwEeSHkQKiXsKbwyRSBjsYN3mWAcHX+3Fac9mVYVWFQcfrdDz2LRwzK7bt
	df12+VM46x4g8aUyCqSf3SXcUWjCAVY5FMWSS+lgkz8hOGlEPPfEzCD+C01LNZL8
	ZJhLgzns1iSxqdc1pxS7ia5zwTAPKMQqxzkHgpc5CBiQC8BMG0EuFEWBR2Knafc3
	53DXmw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp0e2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 05:44:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso4859420a91.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787031872; x=1787636672; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=O8q9uhl7PaCykXODjWqmrDEB8SbWvk/FE484SkNk9HCVBrHriwwr/nsCYbv4U2d19J
         e/CJ6Bk8PYDGkcrLMWx9kK+1QPBR8obK0kPoYVwbPBXlNC/aHTDZ1p0w7xzSqiAFp51n
         bPfQfYplnZcOGpLOMl5z1v0aXSSWVDbmD/h4m7elKWlJURvLSt7eKzQVx2RUCVyQz33j
         A8hvyR/AbFE7Axg1psADp0YGKpcmaWzWIVg6nZoWZc0g5YoSa1CEPfsC8utq9IaF97Ur
         Eo6gBynCUyP5xwRD2I8AGV1e7vhWGk4/kq3Le4gUwKpOuYcsyZOCkkbS7idr5qPjO4Pg
         UL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031872; x=1787636672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=Cnrnyt6GMy/o13kv7X2Nlnbth5EnQfktU81P4+f+yzEBqU2S+u/xt7xjQ+Sr4kPORd
         RRQvZy/beqtbni7c4GCxBFLqo6ZWWW1CtaHtar1D6ms63JINJhC0zDONK7MYIoytfb4I
         WX736hmLY8YjaXepGmjG3Gnj3f8nG7NFX5v/FKAdwmtdKLpvsz2cAqybBbg4vcOaznXG
         yQEXlXykFIYqykYdT6+2FysfZtmyAQV/9FNnng9uYFQWDhkITrPt+pqP0+gVPZPFw3XG
         80wB2eS97lKrCoWCOxPwKj3+9Wt7opIYKtrIxCuS+9wibzxWKjX0X8ipWtrMrWuLi4s6
         UP2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPqcJ+CcXqgoLOWCf3jdKPJh0G6bihQRND1fdtadasOEzr2Y2Bep4H5y2gBZ3fdwmUtWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyydyIfQ3DidxM99/GS2WOQZtE3wUExc/xwlIrDRa5UgEaD5rm0
	F7f2hezjAbZVRt8mpxQ3DtYIYXzP6Q4La1HM1fmt7Zco/Lbo/KfOZYtuFy/9RSVDvezGQdS99Km
	qoFgtOrUcdormGrLONVl3zxi0rsjz/wtdNkhTvPav4thj3ofgv2sHcEE=
X-Gm-Gg: AR+sD11MXjh3ZjWm6RJ6yNBg64I2LCmPzVHZrBZrXJDvsTzjLT3q4gg2/kv+28IakFq
	6Swx/dsvjB0v9wTkT84M0HTnincr88LRPMXOcSu8JkgVhzRI1BxgpHqTt679Vmjb/ohZUb4qIPD
	865l0+qVDnO3MVjDs9Wjl60iuKflronVS6Wia6BWNGfC4rmZxHC4+G9QJmukTG+vh5UWq6tSgzS
	Mf0uLJQYaP55OBTtqlS91SMMYlIvCDgnrrtBSBHa6a/m2aq2OEP8nNutk9j5rQFWr1Nbgh6tcRg
	ZgCUA+GxBaG8ImvtchtSBTQqYtLH210hhqDomy8/JqaoQLcobdrfxOShF1tLBI9l5zjBKtRtCbN
	mfr/9NmgsWXwvferDyLVHEeJEvvTqDIYh3AY=
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813254a91.3.1787031871769;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813168a91.3.1787031871167;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.209.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm7223248a91.10.2026.08.17.22.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:44:30 -0700 (PDT)
Message-ID: <359e5cf6-c30e-4cdb-a6b2-baa2aa21c4e0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:14:17 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260813123841.GC1820248@google.com>
 <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4nobcY0FBQYCLjAUtX2YRDpU_boVcPDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfX6g0Bg6inLoIT
 e6kzIxRlPLufHH8vvMwLXludXnN5ImBJwJstXbXIYucpOYZesWIrWv34iFfnOufgoQLwA1D5MxS
 cuYh6DYYSOSqCxplCqf5kZYHT8FyFMG4uLiXjz4e5pmGcn1ZgmH4WjzawlR1WplyBmIvFJZr8Lp
 fN9XMynfyAEXhkURZJd8iccs8UsRKq4HcfGN7pdux6W/AkVR/Rq4w0Hm7l4EGGF9GI/XBR80SIT
 6dGSqkr3dKUB9i34UVSNJScmDCPag/xuFdE7ht9h7moKIjfdbakG1nOcqoO8L8tE71oW7uSlWcL
 +z1PYLBTA+rsKb+JT3ftnJm7KJFFEtWUalFv+27dvxXEyNuMZFnJBtz7Mb4eXsmNh3fmogzJB3b
 YkMT/uJyFgYy9QN0C0wwOCXsrnPKPTvC6MdYrcIP4XYp8UhDWTG+b5UYqux0TSwFgO4/R1zPUik
 t8IvQ0nIv61glcwM5Rg==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a83f140 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=LF1w/1kWa9VLj9Mif7fHrg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5DcdI_qaGnyFb-cuGoAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfX+4bVm6l6Sr1R
 C+GzVk+zC0rTPZiw3pfqlnDB9GBTLivdDF/Y+I2PFjb/IsAIf2+EGE3y+3S3T6qJmUZQ44wP5He
 M2YaexuysVbh4Ju8PF0+1kcDHIFQARY=
X-Proofpoint-GUID: 4nobcY0FBQYCLjAUtX2YRDpU_boVcPDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180041



On 8/13/2026 6:36 PM, Bartosz Golaszewski wrote:
> On Thu, 13 Aug 2026 14:38:41 +0200, Lee Jones <lee@kernel.org> said:
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>>> introduced, would also need to bind in the same way, leading to several
>>> drivers attached to a single device node.
>>>
>>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>>> child cell.
>>>
>>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>>> PSCI node for power-domain traversal.
>>>
>>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> ---
>>>   MAINTAINERS                           |  1 +
>>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>>   drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>>   drivers/mfd/Kconfig                   | 12 ++++++++++
>>>   drivers/mfd/Makefile                  |  2 ++
>>>   drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>>
>> We don't usually allow the use of the term MFD in devices.
>>
>> What does this do?  Is it a mux?  psci-mux?
>>
>> If not, think about what it is and call it that instead.
>>
> 
> My two cents: I'd call it drivers/mfd/arm-psci.c

Ack.

thanks,
Shivendra
