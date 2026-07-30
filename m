Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1DE417D9B
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411308; cv=none; b=Iv0+iQPYRVQVHzPPLy2Fn3EDzFaWyxqelaF0VOoxCZQfKZyzTelPwMeV0pk8XKot7GzqYr3TSJoeGjjt+7c98ezTgpUvqS2QYcqpQvgJQiEkMDMYETVSWx+1te0NT9qN5z37YlDRWkAa5qlniCV8T1nYEOB/BGjvlPQFhqr5YYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411308; c=relaxed/simple;
	bh=5q46ffEKe/AL/tCJ5clvNOasJqMy2l3vKZtTmAh4GQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meL9k1eD6Zcx7o5cw2QY5vFJCRLmCB4tlagbKXUAJ2MJRdHTshRLQh1DefqQ7z+92O5FVzwoKTvZk8MwOUaRzvyqRNKa6nPVo4Dird82cPWE7rohVC1LUBfYifZyWsdMxdtP226PVH4cMtqRaounW/hsCko2sXgcMEK2eS9CjHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6fclxRi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Or3tZ6m0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6fclxRi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Or3tZ6m0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBWCWA1144218
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 11:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07/dZmQGLQpEoux0gZ8DuLcNzeKHmPfKLFyU53AM5uA=; b=F6fclxRi6NecK1lX
	D5bR/vLg6WzqjEO3ftynbg9l0r7oLrKFTxjVNcZV70JMymLnGcIBKhrwHG90drQz
	oKlA7jF+g+N3pFNJKQUCBSjUJKyZIwTy2HAd9BRkb5XoK2PBorZtw/qsI3CuKZcW
	1mbNpj1/0enrYEe5+jrqpC8nCHgzPGV/8s3cJLPFFnk8CLxhqk6TFp6AZLTVCWPc
	zAH8jlI7Id6mBTdJ3nqwK2a4ddivX+rGFHuqPHtxf8WtJrW+JrMp1F0Oz9/6tjR5
	yAOUWWojumWOv8j8NUgg8LiAk5dX7g+IlKJBQUJX6HoHmND/jQ8BiFsHvitESRj8
	pe+OOA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5tvr0a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 11:35:06 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f582244e9eso51264977b3.3
        for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411305; x=1786016105; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07/dZmQGLQpEoux0gZ8DuLcNzeKHmPfKLFyU53AM5uA=;
        b=Or3tZ6m0/u0s853kBOTo0jrhCjDEp/eu0DCRqzBXHNP8MBjakkkc6XtFaQHPOtxmTm
         tCNMVt4cPpgDZDtFaPl3x4G1x1OFQjJE+fVrDi/mexRmXfwzmJJjGaIf9XlgrcrM8Zev
         p/+NSL9IRthWzOkzOdRFvExXK/i8pb1rG4ckz/KW69yfypiCpgM5H6I9UDi/w20cThzM
         nIqrLq4wJKZV8xKnuysklaKXr5KueAMaFpJg2cf7ZOdiD7wfAA4yV3FxMvze3MRd0RLw
         4cSdvMyvOZiTv+CG+81oRI66Xo4uxQ8X2K/tWqsdkZ0OKBEY1Ydq3uNcXLYDKu0rR1wU
         LXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411305; x=1786016105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07/dZmQGLQpEoux0gZ8DuLcNzeKHmPfKLFyU53AM5uA=;
        b=hUzUtJJVImyHTDKe+OiaCs4LVqpDTnJMHtO6b0Ju0l8pWKQY2nMMZavybJD1S15RFF
         SVvWMnP3qTdNKk1riqTQcuujT0/wO4iH/mDYYJNY41B9HPZuHrMMFGW45gS+KjSgjT8f
         IZDUz2hsLlTDEZS0W5oah9d3ckU5NU/AiQs5PBfgSgyItfbebll3Ke2gckIrYesShu/j
         z1djrLNNQx6YkLqyE9B4QvO+lxqxpfJk6f9wrbDqDvcpGUs01sdb2Ha4U/MxY0l0M8C2
         YKefrpEnoqUubADQTnIxELwZ+uXO55JJqqE6/zpgzlxprzO7hto5HoFwrzZdFicfUbLK
         7wEA==
X-Forwarded-Encrypted: i=1; AHgh+RrVq2oGHydLfFMnQmbEtKyhteQiVa1UFFaDjsmzTDk1TuNedA6N4wmjFfaEd0ktX5Zf9xc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhbANlvGxB7nuoZCDYX/7vjRwcRyBkzdIQQgZ2eILPRoQMTM5+
	Ui2r/YhS65SS2s7O3Jufd0m+Zp+qbE6O+HXFeJ+es6vUD5YRj/N9lsoVK5XQ3dwAf6ikx6ooQ21
	WYjGY8rL1aOkCi2RlwUou1Qoq1eQZiaV6kbu8MzjeLYKyaoT0CpuePg8=
X-Gm-Gg: AR+sD12QoZjKcFjXwsp/I+HA+JtuVo9zB4XfwgSkAxxHeeQ+Biga/HjApiyNhxJthnO
	0wULQ3hnFfu/7HDYySOWc95iYbivslW1KhvzgBkUOkxHuJuChb9qcYspzBgMryTi9rr7DjNs/70
	DOojvqRnx7BSMGr6a/Htp/Nerkm48MTI3AfeQFPD4b5dEJT+oXQlkV94p251FAFquii+dlhV9W8
	wo1+rFmWyiH2xCOCsgVi6zi3aFE/+39oXCoz4GMA0mqHJd3C8layVcvxGRg5kYFwH7o8xnrH5ZB
	aqV2O8N619hoOR2JgSijsjmXKak5Gw6nfH1ClWVJ1wypiMxGKTgX+HVIwVxyFWEKmuLR0UcWf3p
	1iBALH5hyo+s/TCxdSb4BUg9pkZWBdiRlWTaVao/ZuxnaLTwYKo5udkYEnNYtejoh
X-Received: by 2002:a05:690c:c02:b0:81e:4e5d:4848 with SMTP id 00721157ae682-81fb89076a2mr13889907b3.17.1785411305376;
        Thu, 30 Jul 2026 04:35:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c02:b0:81e:4e5d:4848 with SMTP id 00721157ae682-81fb89076a2mr13889687b3.17.1785411304937;
        Thu, 30 Jul 2026 04:35:04 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8926becsm8201587b3.20.2026.07.30.04.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:35:04 -0700 (PDT)
Message-ID: <63b4c911-d1a4-42b0-a66f-b0c84308d5dc@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:35:00 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
 <20260723-radiant-scorpion-of-hurricane-cbed57@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260723-radiant-scorpion-of-hurricane-cbed57@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfX3aHpdcqLY6AY
 Siotvg2YIuUdRabx+vUI7y+pGIE+ryi9O+FfBP2krKUGa8J/SyTFrWjndU8Q70FymnQ3JnU42lY
 O04/e8DRd7toP/S6dGEs02C5WmSmOII=
X-Proofpoint-ORIG-GUID: y91YDeqbHJYNG0sYSbjaY2BbenrkU-Dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfX67uLJbIcH4PV
 +slSixqKLFjBcnjP99AonpcMjkzLFvYj9qntNltD/JHo5yzjdrwu0lOZcePMnWrb81ytp64jhRv
 4+DeBCAcIWEs3Q0TG9AEkVyI+EF/t5vgfEcKukFGTOhE2poyUhYzf0fTC2iajjsqincybh0MvIL
 7BvhwXudMP1NuN6giXDcHYxcjcnX+vm/29Im9+ggGkAT1v9jBLNiNTvYXTH1yOmifqQ+VFyglPp
 9OfoWoEJOYasvySz75NOFmldj/nBCPWy6vefJ+JuYpNf3hAVylzxNbN/YvPK/ZCLtnXNTV65Ujk
 1Atfq8eY09Sdy9SMHKM7SyGsa5TYOP7ROcRuyoX0e8z4nCQna7YipT+1IZOv2w87mtW1+N18MtQ
 8ujhzG4xOaYwKWYoz6XCwmczSEcAMnVYl5sTR+rCH4+oyMBHmmbvGiVtaGCxEL6IxtRhZhX9n1P
 aVRIa3rKRIlq0Alc0mA==
X-Authority-Analysis: v=2.4 cv=ULPt2ify c=1 sm=1 tr=0 ts=6a6b36ea cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NFBEJmUEwPxnxbdnG5UA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: y91YDeqbHJYNG0sYSbjaY2BbenrkU-Dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300086


Hi Krzystof,


On 7/23/26 10:11, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 12:00:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,pm7250b-bcl
>> +      - qcom,pm8350c-bcl
>> +      - qcom,pm8550-bcl
>> +      - qcom,pmh0101-bcl
>> +      - qcom,pmih0108-bcl
>> +      - qcom,smb2360-bcl
>> +      - qcom,smb2370-bcl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: max-min
>> +      - const: critical
>> +
> 
> Binding looks in general ok, but feels incomplete. If this is battery
> limiting hardware, does it actually need any battery data through
> monitored-battery property?

I'm not sure it is relevant here. The BCL is not a power supply neither 
a charger. It monitors a power supply output which can be a battery or 
another source of power AFAIU.

The monitored-battery property is used by chargers or fuel gauges if I 
refer to the documentation.

The BCL monitors the output of the power supply while the chargers 
monitors the input for the battery.

Manaf, does it sound correct ?
