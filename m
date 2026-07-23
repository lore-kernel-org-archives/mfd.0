Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749F466AF7
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813609; cv=none; b=PWpqDQ6/A5JLw4jZr0Vz/aL3ZYRSAXpNrTz2TY2xGG0qpQsOlKnOPxf4+INiIHERT+o2NOIdbd65ubd4oeEx9nujGGXl1ZWPMSO3icQBkPEnbpbqKP62cr6MOg8HjGSvh7m/tbxLKQgJVTSeDVbmodUxMsPai5L9EIHmkWDz/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813609; c=relaxed/simple;
	bh=pWsZFrbNUS6eEaXbQAM66UZCQPvicce1zTVxzu/L6nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWJ9pkicCmsriV/8nH7ihhebBLAe0qoVpucsQvYRFJh1wuNcGOLE5/4S663p6g+J0l9fL9CHKaSwlfv9G5qggjAjSDcPW1fA5lfpsnPvxpI371xzVCg4MQhnZ5AfvyR0rtd9cAO1xf8FPWRUGwB3XlwCAVw7jdxtZuNrsIEY3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5itg1F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPAELp40; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5itg1F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPAELp40"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvU2F3819807
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=; b=d5itg1F0Kk0mU1DI
	fimuZV/3TiUVVzE8yLSvIflcj1ApAf2/HjRwb7DE9KCmAND+kTWLsTmaE1tMl4Q2
	NZbjavDKoY3MQaNgufXBodHRUpggkEEVDXCTtYAoGY1+4MC+hSGfkiuFEf/438I5
	+J471LtDsPK/R+svfiWFa13EYwD3nFw+/P1iyCuIpBFgSptn9UBlyGeOFZFbMrK3
	BXikjjCnAB0eQDgE7eB8b6iAw/6DCAIlpavYu0qrj3AqwwvWk5xBdPnxIWlHXYDj
	qeFuxIKnk2wFpmY3bocGO7H0uFlVwSiQYr+voyuhZnPeJHTmLDXYSM14Z5hfn04i
	k6Jong==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw2e2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:33:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ec54966bedso424869a34.0
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 06:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813606; x=1785418406; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=JPAELp40dLzEJlzUax0HYQl+mGOQx5ce+YsrsnjEfj0+p12JkzBr92UeoMFf2WyBIe
         xKmpFDnSwYFEqr5Bp5KzwgRmPsCyrHk3hjhP1kV5JGNMX9s99wV6HZabc2t+1SoqYYBR
         aezF/lOlt+JyvHIyIb/ZpBWR3evQ62EDzXCFlXHk6FecsnxtVKL6JgoRwOp8VOBKinAE
         lnF6cG7CL40BoF5SVpFYzGXkNUNpdHnPeiwKQn9vYulMAac6mGCBxstgP8oflzuoljFB
         34FQmqsQ0lb+3t2ehyLtMTSEJr9RvtTs1JJtEVt6MT9oUBqLCYFR/D2tGMyMQ0Yb+b3D
         9KuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813606; x=1785418406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=Pulbb/ZTBrPuM8V6qWCZ0Z2krEFWQEmRNusKGFNfCROOtjMrQ1E+ieo1ZiFI6nisa6
         yhftP3NfL75VSlKg8f8/GaIcNGolti1huZv151nmqj+smcHseSlZrpsHB/BMQLJ+C5J7
         +sQnhU/T9T+rN9n7BkpIc2JHCUHE5/PKn2TEInA/bys46loF3afaWTLjff3MVqsMEOu9
         fhlkib2++A8Viu6gkvKwFFZS6RgOEwcB2D7PNkIfLdZWtVTysMqtlWhHWP/8/cLdH+vB
         1mRcs/qJGsE7I9rzoEr1LfZxVAqy/zFKSTIeTJFLguyp6eO9PROkHTDol+XcL5nbtaKL
         HX7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoFyHybFr96k0IKusRSFDfWR55i1d/TP382b2dqY7BMiVznvrK6NClFUe4lkzOgoScBgsE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPH+g0N+SSoChnML68AsZJLl0Z2BB2hOamYZOHOeP24gTMcteY
	oEYoupcoT/956l8YGg+3lkFnj5m50gPIF+HkJt9Sb7vzjxJiv8Qzr3fHTdnt7D/jz3YqbECNo2b
	iB8MqCbnFW2fHRErdi6ScPDXmbYwlicSPZr16iPSAB60hDUfKes1ia4I=
X-Gm-Gg: AR+sD11CDNr8Nk+ZSGNyXTsgCcoKWsX5HdgYhzq6fX1rn/k4W79dtJXrn9nhnYUBIUU
	T0wPSGQBHnNPfaBHugd+dIXdfUo7MFrFcQbF48Yx271ZdiTbsDZptxVPSYf6M95vpHwwnKmnFez
	iKTfYABwbX9BaQQG1GF6q0L++77Y7zM6EYdSCQSyuRa5B62QQEmiX06ZDXUvipoxUCv/THfh9t7
	xVAOO7tb1Oel8L01W1ihv/p7dqLSxR7FZ4fnhKOejYrTXS2NUupPlDMAnPgy6SB/YDZhSVRcxdV
	BnT+6/+J2WhFgffSar8a2Y5OCRKiTj75vuUH8ypx1ZL8iI1RjLaJhWpVJz7NMWIar4NezIISaaT
	uuuoN/5QUma+enGijiwdb2y1LbUhhLynTCFE=
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889180a34.15.1784813606315;
        Thu, 23 Jul 2026 06:33:26 -0700 (PDT)
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889159a34.15.1784813605732;
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a0b3803sm3569083a34.21.2026.07.23.06.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Message-ID: <0ee2667f-db43-4e5a-9b4d-2c2404d4ae5b@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:03:12 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
 <20260722171108.GA1097879-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260722171108.GA1097879-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a621827 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PV7ZYYKFBiq-RxTmBQMA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: i0IJDT3h8MrVfRx57kDP2PnO5VM9sY8j
X-Proofpoint-GUID: i0IJDT3h8MrVfRx57kDP2PnO5VM9sY8j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX22cYyUGaZQAq
 U1wHIOkmFx6CrI0ZqcrMNaw4JiifOqEO7Z+msV31hLwkzA2zhsJL17/pzgHg1o0A2f1DXfjQhEF
 IpZeeiZgEr3xnaKMp6Jg6eXJliZMyns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX+r+cvs1h6kK/
 mcQT5Lz+yIPuzGHlqaFJtqKiVGy5hTtD8/Ft6Tn/GlnXbf0quBu5tt+JEKFqbZc9GGtRDQniKza
 fLNyHYz0l55MHbN3HzXxFv/nWmaAFCzsKB8zei4JrgU+OdExCET2UgEKzZjLF+sDARNiwnj0/vt
 q2V7LsdRE6jNc/0T18PVwwipXf2kfHNsjcUqLw65JPVfFALFUUl6UEqwgcJsrDyEhgWn/Hhl6Zd
 EtO2CD7VShgdLo119jvKdTE9yrfE1JF7YjBs1Intn0XxurkHJSIyZywzpS78/jCsC3mHgqVY1x4
 UJTA4TIGzK5gGlPWCcn7ejq7OiW0j3cSNcYuMfULqrtrPQ9W3fZh6q8jURgW255H3TxBUOw912s
 LkCRrnpPnrLyXrLxdUNe2ctTz4RgnB4h2onLkKqoNxFMvnYP9ICrdtmPwSGlsKqwQ11VX2ktFBW
 GeiIZN9mx/sA4QxyZ6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230133



On 22-07-2026 22:41, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 10:46:34PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 6e2e0c551841..11b90e8affb3 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -98,6 +98,37 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    additionalProperties: false
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
> 
> Since your example violates naming rules:
> 
> "^mode-[a-z0-9]+$"
> 
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +        description: |
>> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
>> +          after "mode-" maps a reboot mode to a vendor-specific reset.
>> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
>> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
>> +          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
>> +          where:
>> +          - arg1 is reset_type and must be >= 0x80000000.
>> +          - In 2-cell form, arg2 is lower 32 bits of cookie.
>> +          - In 3-cell form, arg2 is high 32 bits of cookie
>> +            and arg3 is low 32 bits of cookie.
>> +
>> +          All values should be provided as per the PSCI SYSTEM_RESET2
>> +          specification.
>> +
>>   patternProperties:
>>     "^power-domain-":
>>       $ref: /schemas/power/power-domain.yaml#
>> @@ -137,6 +168,15 @@ allOf:
>>         required:
>>           - cpu_off
>>           - cpu_on
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
>> +    then:
>> +      properties:
>> +        reboot-mode: false
>>   
>>   additionalProperties: false
>>   
>> @@ -260,4 +300,18 @@ examples:
>>           domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
>>         };
>>       };
>> +
>> +  - |+
>> +
>> +    // Case 5: SYSTEM_RESET2 vendor resets
>> +    psci {
>> +      compatible = "arm,psci-1.0";
>> +      method = "smc";
>> +
>> +      reboot-mode {
>> +        mode-edl = <0x80000000 0x00000001>;
>> +        mode-bootloader = <0x80010001 0x00000002>;
>> +        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;
> 
> Don't use '_' in property names. This is a W=2 warning.

sure thanks. Will fix this.

thanks,
Shivendra
