Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986FE4AB1A3
	for <mfd@lists.linux.dev>; Thu,  1 Oct 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843356; cv=none; b=sP/E2u3U980WoSskbTQvyChHi6uGZdpJHdSYSr9ebRyfzbNFD0FvNKdSYNccXGwnoqScI/VKAM5twgcSGN6rd5p7gn/PEKv6MpkhT1kErZD+wglJSlDviLqeMxcbkwRaiQ1S3gcet4/AswpO3XJ66rPkp53Av4WJwd8si0CWclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843356; c=relaxed/simple;
	bh=px9auo44XRq2/gIVEu/P/EZU8qovirN3WcDVMpMg0eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTVdR0rzheSpvPxxeRMVrVCYTixL+owVvBPQMgWXggu4VI9qJKriPxDv3MqemUB53eBpJ+Ol/MV1u7eTjHHUyRvMIRds40aopxYV8GqTiOWQ0XQlrB1BD3uWK6Jm0ezNxtcrZlLuVm3RQnCp9McbS1B4xiN6us19lo9aE/9tmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhY/mM+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ytl9lx9d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhY/mM+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ytl9lx9d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xR651289076
	for <mfd@lists.linux.dev>; Thu, 1 Oct 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=; b=OhY/mM+JVbvxmq5o
	mX3nLXY4kG0ujjBI3ejFR++3esOjOW1dUaCMXY934jZTYfyVK9Z68e5Oe4FycRfq
	UVerHgbVlw0+65ruNxk20g7YXK3RxgGaG9LoQ50h6yaOcQ0Ve0YXS/9o8/LWswtC
	wryO9mpummylTb+WuUoQAqjEBuBC3WzV4aWi7Q4Qfy1YEUipkYkdeZ83Ipob3tHF
	VBw9+KSPivzy42YkQzyn6tdW2pn3v6eqdw+cDajJu6I3ul3fpPGcHGYr4IlNDHpN
	fAQwoK4/JaPVYmcLxZkL4TURERJAVZr4+rWDR62XlfJEhoFBN5Kb6Nd81UkUi658
	HRvtmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjatvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 01 Oct 2026 08:29:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c6abcc2ffso44296585a.2
        for <mfd@lists.linux.dev>; Thu, 01 Oct 2026 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843353; x=1791448153; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=;
        b=Ytl9lx9dMJu8IVw+TfZfQWMExdZ5tv3OZnNAt7LQLHh6JEIbrgQHQcWhnWLt68xpC7
         qyflmZZHfyLeVOCpidKSgUj9Q79JrkkCtD0G4CYuQ/lLsTJa1dUMRIlIdpLmcchk3VpM
         NyE9PV6q0oeLDwj586ll2AG8eLMrfjflETrfhLlKLXbwplNECoef1ybgbGKpN8HY4ub/
         KEJ0s2L2+R8oQ4OzKjpZyGbrxiudUo6QcCCghWfyc3WgMk3J1E67ijFpvcAFXARy46oi
         l6Oofkz0OFNFlleefB1Joheqxhz0AsNqHLArznJdg63lb/GgBCIroxncVeJoCTjITz9b
         4XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843353; x=1791448153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=;
        b=DZW10pjHgt6dx0OtRfbFlapva5vkfd2cXtZtY1eA/GbUO4ilIsWmMN7Rs4LNZJ/G3g
         9qBmdvVuxL2rfucjTz/avqyc57hXRDuO0AlAtplUMmkRLUL98Qha6QDwBNiVpvgvntr/
         8ennELBjbl6r9kLM/r66zpJO5CKuntm8kHoLLO2ou5MIrQ7+t8AOy5vAjfZ/vAxYVBlT
         T/JqqzpJzU1Xgyck0eC5TBQQdwaFU4qNvPTdkauNkabHtJhDgorQqPD2Auy1l7N3xphd
         Ak+TyjsjpvsYey+Mom2sJESDeulwlzbqdY0X+91tzeSS3lgRscJXCXmF9VqnTjIbSkI7
         c9uA==
X-Forwarded-Encrypted: i=1; AKwUvBz0MCq1Ewm4D/11q2Jpa2FzKwzIgUVihSLWWaIVrt16jQSHyGdDQHbJ5j2AWN842qR2UKk=@lists.linux.dev
X-Gm-Message-State: AFuF++kYZ/+Un1tONJCuvjUtszBd4uQwOKs3Jkm3+M+2XCiFsAFQZJBn
	0AnkIpAYVXkzdThdhxwar9A0YgMsS1ay+Q9Dt3la6SfPYBdBHbKyNo0VgvfFBvVy9+Cm7tefC3o
	B53qJ9SOxj9H9Cs1Q65y/J/ShtaziRy9QrDFYwL2zsHvMY/+nYMYmxVo=
X-Gm-Gg: AYBFou2yyOGuyKiWWduZUY8p0dbcrHcAed8HliwRUrBJSilQw/0JYc01Slhhin8IMgS
	6PemTAjhSP+BUdPHoQEuPUQvg9wG1VFqvFZowN/H3yhXhyvMom0AjLvfKAZEivF8S24clPxoLdk
	a8usrBUddjvlQBc/Byayxywf3jUx99QkyCa0lCkzkqyeaxP4thzAXKQt1MhCjdiGigrNoJxprmC
	6cu1PYvVkoEDlpZOLnfql+p4Rf0Dr5qpIDOtgpfBgewDdUT8KSUcWEapRAonRC+95tczpQIbUTj
	6Y8B/5/j/nKonLns7Kd0eOnCFP4T7HdOrZmQXmcNhY7MyjOdzpHjq3yC78ObREUJJo09fFAPZgd
	pODrIf6MXIMkzlqfyuN1PPQ==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr676878285a.0.1790843353437;
        Thu, 01 Oct 2026 01:29:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr676875285a.0.1790843352958;
        Thu, 01 Oct 2026 01:29:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce2ac2sm111175366b.29.2026.10.01.01.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:29:12 -0700 (PDT)
Message-ID: <dc353f9e-e189-4ee3-9c4f-de35b07ffe7b@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:29:10 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
 <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
 <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe19da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xMYjRGLvxaAixDAT_M4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: E1y6rhQz7_-zAQG4_vee7KvVajZTk5Hr
X-Proofpoint-ORIG-GUID: E1y6rhQz7_-zAQG4_vee7KvVajZTk5Hr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfX0fl1MYTR4phB
 V/MHPnTuoK4CQdvdA5VOBujIpJgOSk1sp6aFjZSNaskSh2DjbGFkw4/CB5L4N6/YQPkRXqCYxVL
 4TLHWKFSdg9IM+dma2gny5f+igxl6Ro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfXyxSnF4nGc4KC
 nFtiyuYl3CGIocnCcUiN70vPEqRn9zjlmVJUw38zu2NMHmHTC8ZQbK0Mw22HVrCe2QTaDWy+RyD
 GRN5axLuQx/Ah3MyT4v4viLtLbiCrcyUEw/2TiOOhJEgvTI4FOPWWcs3a3wKNAz9+9eoO5DkK6p
 03aGgrfctFHmytcQuz9RGIPB/FJjlZe9drWn8o3qlpc3KWu1MCe4mZh2sYWbHAu0BgTK78panWp
 we1J9TK5nC84+uBOlHbIjjCauNVK67llZWnNMKkDloF3HrohEsrVXTLESQAzuCoI/Fy61wfSjbc
 xQqSPXWlMuRCEGLphafp1M1ysa6Gk/Yh+vpn6ZTfRYApRNa2WAx+SysIC6gPDBT63BSxQ/Ypoci
 m9tTr0qgasEz8jLYYwIqT5JltDcOMlryJvZPSp2+y292l+Ouz7WPrxSOkMHHr0zadJA4ls0wY6V
 5u2IkHkwj9oHNYx7VFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010033

On 9/23/26 12:18 PM, Jishnu Prakash wrote:
> On 9/21/2026 7:03 PM, Konrad Dybcio wrote:
>> On 9/18/26 6:42 PM, Jishnu Prakash wrote:

[...]

>> or drop the GPIO support altogether, if we conclude that they are
>> fixed-function on PM8008 too (I couldn't find clear info)
>>
> 
> Hi Konrad,
> 
> From what I could see in the relevant HW documents, the GPIO
> functions are fixed on both PM8008 and PM8010, so it would
> be best to drop it from the driver. I can a separate fix
> change for this.
> 
> Do you think we also need to make binding and DT changes
> for dropping this GPIO support?

It's okay for a driver to implement a subset of what the
bindings allow. Maybe there's some esoteric use case that
allows exercising these GPIOs, I don't know

Konrad
