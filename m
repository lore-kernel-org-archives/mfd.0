Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E3362120
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313112; cv=none; b=MY0CBwo9YJ7Zdi63FYplAfMpT2kTV6UMDgy6s6PE+2yv32wM3jgXn68tXUYm6eunl/yWkPF8PAK+/DDDLGmBj5bMeX4bmzQJV2FGAUqWTgakeLi9G0rk3fGgFNPC3yfTeVBI5Dwsnx5g18Umy2skt5N8mdFzdLklL2LDEA6JW/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313112; c=relaxed/simple;
	bh=ld4R1jneXBW1hGoO0VRUWX/Y4qVOEP+XupoaDss+ItI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vg9/OOWv5GJfkRlzgJ35v4cLLYFBzWKgQPtmojEtKV0zGEfBR3wVoKkS/mshORp7jlCVgU+nJhwxw2h4ZEUnQx5qR4DCBlIiMxDSGrsJrlo/1IaQSqPZuQZaFih1EMz0zdd2x8hQJ/DbeAfp+HEaXlG6riKECgO20Z2XRAjwh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UClpXggN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDmkYF62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UClpXggN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDmkYF62"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DDxx113039763
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 15:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=; b=UClpXggNDGnUoju4
	8s7pg2DMW+aMyZIUBvoIm3xqhEDNuIZ4G7sd4CZmdYMnHd9zDSUsG5sjzuWrZDYg
	qcVEOykNpnfBaM7ZnrgJiKY4L2LJZCYnSRsf7WlQ/j0Qy1Mq+Li9c58BMLT5crGK
	p24eMVk9QrUCvPcDchUlxN5jCfOie3h0kC2kYxMJblMD7ubKLtio4iDmTlsw66xg
	cyLXq+/xwyLLBs+OnBgqkVROVXdGzl0r8tcDDDGFaQ0xLcMvAt9PNDekthiXMMql
	YhphqN8MA4xiN0Yy9MKDIVHK6ojMwvU5xHfOmCySmeQzZyAhh/cX9+QiEU3mjX0F
	jwC9Vw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ckj28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 15:25:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3525587a12.0
        for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789313103; x=1789917903; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=RDmkYF62sSIbjU3T/XU5axNb7OA0rbY5Hj/51AqN7BK/WTC2vzMjAd2TATgwF1QK7x
         IKwS9iaUr62DfocjeTHeGtpkkavXWGZ4SaIPgJH12iDuoNR9Z5j2F4RUOvKxit2BH5XK
         j3Np7fXOAjTvT9asqHVscp0ZBR5zFhJy4RwPojjE5vsya+MT1LQDKNxgjQFt6JrRzmwP
         FvMHVTE40NiqlECafaCf2je+MLCCEOtEVecZ6JEbf/vU+jdu4soNkkID3g47XzfsI0cl
         SZ8vwuRo9qtYTfloWu6WqTkYR4wXmEnxSGVyYviBarTNoHqNzOAN0obbARXsM04Z2s6h
         MRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313103; x=1789917903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=FBEq+KXXavPOsm2jmfy6ZMa10KnXtSRF55aisRkbpNLYKaB8cAdGCWOeimTr0KTgMk
         BIkPjZwks48rbWOn6hT/d1bAMpp6lc81S1tw1X/YPjEvK2zhW0d86CoMZgzU6ov+DMtc
         LnuVpXKiv0KocbCbPe5XjIN2km3oY5X0tjxQmYqRELk7j466l4U8qTl1pJGFELKN/kpc
         gvW3d+n9XHwq/JANcn40eY/AqbOOfku/rSwDnSc0f4gRKR/1MUGNoCUYxZlywCD9NtVH
         Qw6mZgLfB7awzgmN5bkqaFV5Fs4zy3B2DNQiGt5mpNp5QB2UI8Y9jC20CT+F1i8RKX9A
         vQcA==
X-Forwarded-Encrypted: i=1; AKwUvBxtgMfz6Wla0mujJV9n5BH3PHMuRyLd67youtAYKQyBn2eYMRuimVeigaxrlKh7h7F3+Pc=@lists.linux.dev
X-Gm-Message-State: AFuF++llWav+/ORcZazyLD9GZtZapIy/BnNekL8Oxv+JtwMHIqvpMdN8
	/+3jsyNnsd2h4QoBn+TkkxBs2IIrzoOoS70mgcNwYrT7h3+aH4HALlSJegyujja93QSTxOv+nzK
	/MNspbq7aKRM8FV4Q2uXTCV3siGh3khGg0hpW1H62j0viYYwJEUdjqCE=
X-Gm-Gg: AYBFou3RBYlMAj9LYe1mxu1ZWttu2O0Wq1Syz4j6YW6kcO050OhyLxQNLB+pNmce/ua
	ZAlBY4VUvL92dRF/TeajKk0gT6AAZMiREMn/S2NouK9Adip9oWJUwdYtv/OJkjDQQqFwj4LGQ5P
	0lvHgI2u+Jgcxi8LRUWHYYzImsZ2ClS0W1pGqfWMhO+iA6c7rgUVrsGYc8V0YsXSnab4m2m+w13
	wjfmn5eJeDj0lnAa4vVVt6ZP+3Pa9N/ZWf6P6BMFQK0Dn+gWHVgNZKbCEe72n/B7T8zHElNcChR
	umWXYINylPAul5KrRG40YXGzydPd2G7sTkrmy+wOYvM7p1k90S3VN36843dYlKcNdf1BRVrkPnw
	SbN0Xi2RXStGQI6xZYXtjh4WA08+5JqZ1Op4=
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011594637.17.1789313103232;
        Sun, 13 Sep 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011548637.17.1789313102860;
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.232.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm19916161eec.13.2026.09.13.08.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Message-ID: <9345454b-4e31-4224-980c-0066c912252b@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:54:50 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
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
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
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
        Srinivas Kandagatla <srini@kernel.org>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
 <20260803140222.GA3188037-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803140222.GA3188037-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfXziqU77X92zIm
 nGeQw2QVK/5L5UYQ7RE/X9M93Yl5dJXGbXPDuNvb6O690n0zxNTIt9N5S/rqk4Ps7clZixFMAYD
 p3/0SGKPRcr0gY7uGC2RhOxcRTp1WUAEx79VbrGHXKuQOx4dXLrSngfR144sv/VFmnB8s/7KMl4
 dLI/phpXUHp8004FWDd7Cc8cdxqnaZrcFgMVM39Zf2xnoykJRaNZelSEgCFNei3YRrUovu5VX52
 X7cvuiy7s9rC8a3qn9XooJ2mNolvFdZptjrK7CcGXz2WUFx27UB+YRrckwNWCdEz05RJXuW0Ik/
 /2+HyPbNPCfVjNdF3TklzQ6Ject2Dj76p9yxCLslgMJzJ5Dxhnf+ZQ+w4azB8vQCLzf/sClmfD3
 9pn5ym/nCN1A1fPkg3nQjFW9QJGJB1stciUUkEMw2dpipz/hQKG62O27BjTZfPUY3zC1ZAiTnPJ
 E9PwPB1ElwlxpIbMsMQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa6c04f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ExSUBmHX20r5BGnuCy1yUw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=q4JZvQwPHRNDhfj5UpAA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfX8lBoABY6WmOq
 tP//C+ynpsq9mLZ43wSVuvzKopvAkS33Lmyq9aM79UGF1jTwcoEX78Sa9FoKSdg0cKcO0tQttXY
 pzDgUIdQgxQFIsJ+Azs1G6Ta1xfyE2M=
X-Proofpoint-GUID: dQ6wxbjsueicLCt349Is6qCrSVTNZCjR
X-Proofpoint-ORIG-GUID: dQ6wxbjsueicLCt349Is6qCrSVTNZCjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130220



On 8/3/2026 7:32 PM, Rob Herring wrote:
> On Mon, Aug 03, 2026 at 03:13:36PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.

[snip..]

>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
> 
> SYSTEM_RESET2 was introduced in PSCI 1.1...

just wanted to check on this.
we have a max of arm,psci-1.0 defined in compatible.
SYSTEM_RESET2 is already being used in some cases with "arm,psci-1.0".
how should this be handled here?

thanks,
Shivendra
