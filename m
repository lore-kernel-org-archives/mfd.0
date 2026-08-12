Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B290430CCA
	for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532424; cv=none; b=jSpAJ75bpGv5LQResBt+hm9aCby2mrM3vzsEvqmsMGkZoijxYiP4g80KbxhfIQl8Hj8r/cfBfwXjpX3piqltMoNAzmQeLSC8wZKmUPE7dr5xsWEiyS4s2/LZGEoNG57lFaKC0KMmr8nrJ9rMbme0tBQRZOM4jtOX/UeLr6Ynn8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532424; c=relaxed/simple;
	bh=7Fo6r36FUHOo03XM7mJuG/3KNscapNn48SHiyBaY9/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW3kuoBJfKGOn0SYtNWps7p9JoKSaXoVscWxGofhb7ltcups0qvmIUjah+39geC8QjCz9agZgRsBKeBTYf2xH7m8aBDTJpRpJHG8SE+EkXDbK9U55q4tEcMTQJhfxta2bZevVq6/iQDescI7T2bqLcaSWjkie77rgzohksWnYvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfqnWdQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7SOKBZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfqnWdQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7SOKBZY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9ftU23436410
	for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 11:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=; b=FfqnWdQYncWPzL56
	Ec7PoJC0MUvbjBkZWj2QdWn1i9md9iLe3Qbhn/Nq7zidf+Gq3IpAuaA3N4Ta3oLc
	LMWHqbCyaWST+Oi7Xmnua+QhHWT83DHt/pPY1Ghb5m41pI4uKepjAGKUkUda+QKp
	OmwTM+00U06fKfJygNI4d8+pWZSs50HhFE6VwtMyqZw9Icpu46wedoZReZYtKzAU
	JAzGhZFNv5AppXjnKXtny+ZmnIYnOO9jYT4WKGACscoFhTO/81NvTO8o1OLOlbIE
	2bgcDwuaK8lvdPiXavveyJrzT8W7eLrQ/3bn5rwTMYlEvZZeELf2k1vczYpfQPOS
	oVgJxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2sgq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 11:00:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so1034663a91.0
        for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786532421; x=1787137221; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=;
        b=G7SOKBZYu780LkzICYazqC+/RrOmRlvZynmDR6a+42qX0RfxeUwUmThKKr73Za1WxQ
         zqCdmX9u5sgHA4hNeMcJBttdFsReRnncrEoBY8FaubFTg/Kl/+zlb6B47y0aHYbXd3/g
         VEryiz2fqW5hOqQ/r2zcZ10IyPeqPwSHa78AqrXmz+VUXw4ima2Vs0EpZg10HSwHdpol
         VUcwVn8+B5CHYeA06O1AcYEF8zVZM1iDeKT/Shz8ahZsb7gayYxuUIZdre1zZ0lm1s7y
         Xd8eBU0MZfCsH0c5sqPx/PaFSupmbwYl6cupq9af3s1JFj4xqWUQw8v8CX/zYY1mw0y+
         9Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532421; x=1787137221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=;
        b=B7DPuDOmWbXCluqzKUSK9Am2elDkuc2cQm9sq877pWKNmiJRHc3RLBrx3tYaCe9U/f
         So9ywY0W7BDcYLnFHsCB7HqY0TiTB4pgv7dPvZlQzLlee6oV3f7oCGRenxans4MvvMW8
         VnMrcLiGLtkqUvbPouyeckkbs8U9C7u7s2gJlE7PC1/lNP6pOaOzPLhsNtyRT64VYrZq
         Gju0b80sbGs05YF0Kyz9AMwtBCHhGQL2LhuFkZZL/phxtAewavJuDqlg5gyng/GENGWc
         JsoFXGDV4Ef3c9uNudcK5v4FbS9ntSVtIsvcp0yUsF/dBDRXc54e3btMfO3evK09AHw/
         nTPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3RyexBJHpbRktrXsNH81NivB8ZqrmqwHJ0qAYURX5hR4rWBdlI7eEEBQ8h3uSul0Fy7c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Y+FW2bgnAauUjZbLX1Clej3t0hOA7UcJLFIyWKaj3IPaIzbw
	LVnfBy8yPaZkiOPj66zGZcUDcqe1tu4e4cLg8P7Mt2OImPm02y1gIklqpJYfUhw1l+1/Lfo4b1P
	tcVXdwLL/QoeStjnAGJvzuYVpwKqCn0CwNCzHl6zxR7sbbY3cyXKc8To=
X-Gm-Gg: AR+sD11NZrjPY2RF31WytZNB3DCWIm5mCGRewWU9SawYhJpxszstxCqErD+hm/mHo89
	F7fXRICBhaYN5whGeyrVyrRkS5rOH+suWNdmBDvuJVU8ToXlNmjyxERiyTFQ3hyGRCcN+BJjhqF
	hSDSFZr9tmsijHrinDbwnZTfuZfw9QdglyeMw1KqWIZp1jDfHuGmr2nOy9YQxr6gz3s7QhXqFB+
	6KPsPGXLR4gRy7lRYR4a4+yQF3Hk+QHiJiM1AOZaWpN356TB+zTzEjzQc5CybbXy9/oIGFJWSkf
	WZHX2LeDoQoNUlw5ImDgMhEef/gzj4cX71P/1+bAEAdWueCx8JDjUBMV4QlsrrXuawm8xlsz2S8
	6czuKqY4j+UAEXSZXW8BFee6mylWhREbbYQ==
X-Received: by 2002:a17:90b:2701:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39301490cefmr4455504a91.13.1786532417032;
        Wed, 12 Aug 2026 04:00:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2701:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39301490cefmr4455414a91.13.1786532416553;
        Wed, 12 Aug 2026 04:00:16 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f73csm3181551a91.6.2026.08.12.04.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:00:16 -0700 (PDT)
Message-ID: <c4a5b03d-a4ed-4e4b-8e45-8c9431c23c0c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260803100023.7AA1C1F00A3A@smtp.kernel.org>
 <20260812081521.GE1072730@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260812081521.GE1072730@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c5246 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=84XDBkMBUWCNCre_yW8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: KSH311nxnXer8x_i5W2y78VwMFkyVvSF
X-Proofpoint-GUID: KSH311nxnXer8x_i5W2y78VwMFkyVvSF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfX5l58s5Qx6cBU
 0CRfO2rqPxBq4flfp0hETy34vOca2oaaVHazXW40xcJ01RFl+OYdb2QsID/wR4KcSJNkXlbHhI0
 tPhmCHt6Ak3TjbQBSlwQcEt/cip6Qow=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfX783NGIeNL9Um
 JSxWKgwtIXlhujYhXNkAZpTrxZbPqQIQJUDUr9FD/yfsw6Q1xApB+CS4yVUCZfNqXuCeKsR4SKy
 oF9XAMZdQsySSB27Jgl1p6Ie2lhh96RagBrmzr5EcNp0Qeix/6KhvC9n7ictjWsuHocP+hVtV2V
 nEW28u4Df2PdkmicMIgkoCRz8J67XfcMse/Jmxr1lEvIEZFTGTi09ZJG4IvZlEMNC1O26cXmVbL
 304Wmu6Xz5Ah8wNuUZCTd45Az0P3G/kYPzI6bRj7ftHXQive4Iu+r46EWeCeXx94xW9DYA7khk+
 mOXqe3n2rMdpESQ96mMqgXw1ByEUSTSaO+WgnNLVjWvVqn+QeAKnvGR8gC4pjo5A6FIsLQSPNGl
 vjOcCum7yzrf6T5crsITDg6bBnHx/NyxM0W7fUga5qz/pGzsM3ezv4sjZhgJBtaakDClbE3u1tq
 h1bAs7PzXAfiFGVBiag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120088



On 8/12/2026 1:45 PM, Lee Jones wrote:
> On Mon, 03 Aug 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Medium] The new `psci-mfd` driver lacks a `.remove` callback and does not set `.suppress_bind_attrs = true`, allowing manual unbinding via sysfs which leads to resource leaks.
>> - [Low] The newly introduced MFD driver, its file, and its structures include the string 'mfd' in their names, violating subsystem conventions.
> 
> Please review, explain or fix the Sashiko review(s).
> 
> If this is a set, this request includes the other patches too.

Already replied to Sashiko's review comments on other patches.

> 
>> --
>>
>> --- Patch [4]: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell ---
>> commit 26907aee3ff3e0a5d7112a9be25ebbebb10e94c7
>> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>
>> mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
>>
>> This commit introduces a new PSCI MFD driver to manage multiple consumers of
>> the PSCI device node. It registers the cpuidle-psci-domain as a child cell
>> and updates the cpuidle driver to probe as an MFD child.
>>
>>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>>> new file mode 100644
>>> index 0000000000000..7affd6bb09dd8
>>> --- /dev/null
>>> +++ b/drivers/mfd/psci-mfd.c
>> [ ... ]
>>> +static struct platform_driver psci_mfd_driver = {
>>> +	.probe = psci_mfd_probe,
>>> +	.driver = {
>>> +		.name = "psci-mfd",
>>
>> [Severity: Low]
>> This isn't a bug, but does naming the driver and struct with the "mfd"
>> string violate the MFD subsystem guidelines?

sure. will remove the string "mfd" as per guidelines.

>>
>> The MFD guidelines state not to hard-code implementation details in driver,
>> struct, or device names, and to specifically avoid including the string
>> "mfd" or the driver's own filename in names.
>>
>> [Severity: Medium]
>> Since there is no .remove callback provided in psci_mfd_driver, does this
>> allow manual sysfs unbinding that could leak resources?
>>
>> If a user unbinds the driver via sysfs, devres will destroy the child
>> devices. Because the child driver (psci-cpuidle-domain) lacks proper
>> cleanup for non-devm resources like generic PM domains, those resources
>> might leak or leave dangling pointers on this administrative path.
>>
>> Should .suppress_bind_attrs = true be set in the driver struct to prevent
>> unsupported sysfs unbinding?

Ack. will set .suppress_bind_attrs = true. for psci-mfd and 
cpuidle-psci-domain.

thanks,
Shivendra
