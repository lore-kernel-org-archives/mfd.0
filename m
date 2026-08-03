Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97F840F758
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766897; cv=none; b=hcElobkpP5UNAIYM/uJ0drjUCUFVsfpDF3ijMvO8A7aLosgLEVv8xSGPRXUsJ4NfnZgPqSp+ypzBJlmCVxDEW4T9HGsxBTUZ3DbefQOSJ3ShY94uRDI0VEH2q7LvpEHcznjMtt4MVIklpm8kHpm8mVcg8fjyphdref1mhV9no68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766897; c=relaxed/simple;
	bh=xxVLiq26aREFwmOzoSKDuEH5j4IUCHnzg0NLhiqqzC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVqjD6NqnzISTBu6hrr6dq/r1f882NZxYb8mvafKFIIsjNAC86ly+HUzAyioXsMrHaD5rmRb3lFzUTSLYsn1agfv7PnLVvYHxM9dEkOHiHnkdpGlvsNojpYDBZabmrApMWG2MyI2UtTUcOb9IkYt5T90xgd0nWyG57m9NzOZjXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldsu9lv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3D8fiYp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldsu9lv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3D8fiYp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBvAv1133429
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 14:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdObhLmEiO4/ihNrGJ7V+rN3FSXGswWQoclVhlDfKmQ=; b=ldsu9lv+B9cFgVQm
	CGZAe5mke5nONmvdusNdpnNtCCICcx+WU7F9n8DBFt4tT0lCDVrUhHsyTCAjVHD5
	GbDiALptzCutqbkSc1si8C89mrD7pdirGp3pmOd3INW3Ra6cSEgYbCVc0UjvRS78
	vBXnRwTG7P37/G1di34v1C3sHQS+VLz+3G8EIb0WMBo49pFaMjbDgc8H9Ji6nD96
	wpNvH/bPVkc86E5K8V21E+YzzxcTfpAo4NXuJL6ODj22eV6388cjHDbdCufCj2gq
	UY9SI4RjoH38k+VqZ5mZWz05nIMiM9ucbrph+10lhljx6QNK9XnJlO26dDn0KWP6
	Fn9ffQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj79y1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 14:21:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso2084766a12.0
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785766891; x=1786371691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdObhLmEiO4/ihNrGJ7V+rN3FSXGswWQoclVhlDfKmQ=;
        b=H3D8fiYpwCUKl5Rd9oNOdTnz7a2YTW3jy0z3N+Xn5txh63kH9T4YzEIg7yCAmW+jXD
         AKN5nwEsx9FGz7Xybh6WvaWE/qFqVlHd/zSS4Ph/Zc6iY0ixjdXGhiNv39xqxmaXzvG0
         42JKoeOBlGNszImNNF9GfjxCTcenyjSf0VDvacoRsHoXEbgsn6buu6l6h4jXkFk/zMx9
         U1PNRxsWhFmEwnLL2n9t7Xv4eTkUkobIZZ6vI0toMexvDNBu9TGP5akr9zbzvdSF0XSs
         4H8BLQFS8O0iPEAEPXudtb9mAy0fEjgKE//JL1sQohPFtUy0cDgFEjrgl1TSRj4ilQxB
         nHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766891; x=1786371691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdObhLmEiO4/ihNrGJ7V+rN3FSXGswWQoclVhlDfKmQ=;
        b=AWwZo7nCf18m8+i4YZ5osY2Sk6jIeGzfJjjz3onEaqzxalV4uaF/9MBXF0I84PzU1q
         taBIRlPIaseFsQVQ3l3/RPl8VDaLqFh4guuua2FUKNBcWcD54C5xOCajJ0BvbIC5CGvT
         B4nvItSgn22UrgmeXx+wZlPbPG89OsLBWDiJYYsj/wm2FnAGHjWsLS1Vpmw0tGZDFTlE
         CYfu8BrORer1330P4xUhtsUdGEadeujGarVf0PVMFG+FBAE+DDSm57zVPA/uTchWwqee
         P654lmG+4Vx6OIqVclFLzqrP4yqpti7JuK/a5Y8eGes7ro+rrBHQ6y2mCqggO7Ua6Mct
         1/+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq34JD3rlyghptW0Q9rk0U17wcuSS5fhHMyka3wEAekISWAJUMn6W3LdIs5TtP1vD/0E7M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqiQNBm+XAoMg+7XeD9QI1xeT+kKN9ZA2Fm9l9ZaKFjuGaHdik
	aNfRYzeRMf9+oZwozjzon500vvyuKF195V39OGFEoh2I3LNZ56CrSTJj6e42dhT1Xki6ZkgtOdV
	f9mEl6copqt3cobkLBAnSxbx8oSHNdfPTuM8yw5+Ll13hIT686J8uNm4=
X-Gm-Gg: AR+sD134/ueKq2+FVVoxq/Cw1kFRfMs7Of1G2ADKUDuS1+AewELa376uwkCbxJGNtp1
	zvNw3YuIH9ZVZjpImU0AeFtHbx6tNHueBexPKNxavzrll9On9uy0o49HQsl7xhlMIhvYuFirdUS
	xhrNm0imymYaebrmeObn/wMFXPNTiANUMAXEsamv4D2PJ5gVLrY1hLQHexbGRR9M2xd6rLcFRT/
	0Y9wUViVj83FKhvt+OJj/Tfa8Su6ZuQbD6fXlCQ2+0C6JMwS1kMbgXcfiwOQmGzFxIYrudXCix+
	OJLLY4V5ovTv/3EFJPwtSkBm4rTho6HoNCWAMbj10i8VvGWfhAr+fFtOJtiLMnO3JMH80MS26wU
	Mtqg/TUnoinw6W7zTU+7grOVoy8Ze1Z7elw==
X-Received: by 2002:a05:6a21:468a:b0:3c4:1c9f:d91 with SMTP id adf61e73a8af0-3c92aa7d0cdmr11448444637.59.1785766891405;
        Mon, 03 Aug 2026 07:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:468a:b0:3c4:1c9f:d91 with SMTP id adf61e73a8af0-3c92aa7d0cdmr11448370637.59.1785766890901;
        Mon, 03 Aug 2026 07:21:30 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm51441432eec.16.2026.08.03.07.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 07:21:30 -0700 (PDT)
Message-ID: <069a7ef3-7c01-4366-8643-11d791bd0d96@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 19:51:17 +0530
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
X-Proofpoint-ORIG-GUID: VXbKbG7OjOAgGeF2eofmiZj8uAPIKERR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyOSBTYWx0ZWRfXzfqc6aAotc5f
 Maf0yxtGZzUBkSN3aC2dy3MBSehh/zgTfieG54GuUGbkjdBJxiF11GlhaqHrqloQX7zXOmyGCuX
 JL0sKwIOmYs8zo8+wWPt1KSpwwAnfyC73of7YjAIIZ39sQk9Upr18otV86NkRUHbpEbdd2+kIYs
 xqt/fOtMHuCs+D5yzkIEEE8nJxtQ2ibE5H8VY3hcMOYoT4ytraQoT6lUs4I7rVKTbRGl9LiTJRy
 NZdpANKCduEcJHgz9+g/UQloVA5MySBNDc1tvjG7LR6yCamgwj2VJ7RPsnvzkzLr8m9nW6uzLmb
 qOtvcCyYGa9ZbW3WPO/03yldyZrJpXVshlofOjZH6XqQHCeOdDu0hBGZYxda8O7lifGyJ+1EY1N
 mGd+DL73O7R+HCHcJ4wtyaJoK5gWrUQnQXAxip3WTc3TVpnb3nEkO7JEQdBLXBZDQbOVMMFZ0HS
 FKhtbTVoEJYre2IkVrg==
X-Proofpoint-GUID: VXbKbG7OjOAgGeF2eofmiZj8uAPIKERR
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a70a3ee cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O-cBmbsoh36Jwjk5jm4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyOSBTYWx0ZWRfX/cJOJmxvmCn1
 +tP8cAcwxGcMCageUR23nfsB0LJHpY+oLzUrEPtvsDnzso38GOA4Vj/8Q84+hMPrsVx+3/U5W7m
 wxW/9L4p5QB7gU3oqAo0/4yqXmeOBVM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030129



On 8/3/2026 7:32 PM, Rob Herring wrote:
> On Mon, Aug 03, 2026 at 03:13:36PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/psci.yaml | 58 +++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 6e2e0c551841..7d6a86690a2e 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -98,6 +98,41 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    unevaluatedProperties: false
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            allOf:
> 
> Don't need allOf here.

Ack.

> 
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +              - minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: |
>> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
>> +          after "mode-" maps a reboot mode to a vendor-specific reset.
> 
> Blank line if this is a paragraph.

Ack.
> 
>> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
>> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
>> +          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
>> +          where:
> 
> blank line

Ack.
> 
>> +          - arg1 is reset_type and must be >= 0x80000000.
>> +          - In 2-cell form, arg2 is lower 32 bits of cookie.
>> +          - In 3-cell form, arg2 is high 32 bits of cookie
>> +            and arg3 is low 32 bits of cookie.
> 
> Indent the list by 2 more spaces.

Ack.
> 
>> +
>> +          All values should be provided as per the PSCI SYSTEM_RESET2
>> +          specification.
>> +
>>   patternProperties:
>>     "^power-domain-":
>>       $ref: /schemas/power/power-domain.yaml#
>> @@ -137,6 +172,15 @@ allOf:
>>         required:
>>           - cpu_off
>>           - cpu_on
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
> 
> SYSTEM_RESET2 was introduced in PSCI 1.1...

thanks. will update.

thanks,
Shivendra
