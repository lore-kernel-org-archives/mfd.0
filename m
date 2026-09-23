Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2747F3B5
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158693; cv=none; b=KIK/hHcK3e7+uW+W2ylv2W9FFU1OngmMaPBaVt8fR1dEbH7Mqcc/HyZkParlctxNgc2W8e9vPKdXvsxvufC7cbQCr0puP6sr1+q4lkGQ7bDgXngqaHF4H5btYkZfgyrvLv72PrrWnBeWsNDeRc+slJBFxcdWpp2C2P7pvrHmNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158693; c=relaxed/simple;
	bh=z1ZwbLcUNGvULc+QXyi5mL+WX2bmwwnwUztcSc1jjyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sW2w7AXcweG9E1uZ5mS9hm5wB098/Fo6lAxdQOcAnc9iApLAvqtBhgosamifZJ/2atcYeHMDH3Wm9Pfh8Uuv49d8zS4dZ151Sooe1waMHp/qGQrefQRB1e0mDEH2sH8hhGjah80tUX+t6V+0y+u2V+YM72dg+gLgrLn6ZzKrpVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSwDJoXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9AR1zc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSwDJoXD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9AR1zc9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA303q4087736
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=; b=BSwDJoXD3HJXdLTq
	yPR9NPXhzNzpW6pMf8JX9NbOl+xij5Dzn4UbD4xePCvuBM7JZccuney8z29I0JNv
	FpjxPBLX8gK0phT2ZhWOgvSkW5mQ8OAmN7vubgjruT3B+XV0z6VWDCnf8+jjuCkR
	2JbrkqLxSYqC1IPQQ9qk9sPvq6PDW7za029uoJpSs/BSWebnQkT8F8iHvGJt+RMX
	fYMNv0vXP1OWjXwuLQegjI4e4pQvBu4bn7SzBQLcWKvf9GlFZSMSMQss5Uqtbx4S
	EJJsjvX6OgR1sX/+qTeV+84zCzwQKoCRT2KJkDaMWT1vbhy/MGTbSeDUBzaMFf6t
	RGn7iQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3ufp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:18:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bb08e80a8so734789eec.0
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158680; x=1790763480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=;
        b=P9AR1zc9gElhILqxv53mb09h9qs/PFLNwwyaOTOL82M74V2U6OBNUkz2vjL+CCQcBA
         2osZsYp0tlwpofG9ZWqjsm4zwv1WOdR7QblWfc+1N4+6s05pQGfrIFRcgix8xDN0uV1S
         /PBe+u+dPlfONl0T9CCWkMMoo1h6KA7NjZsyFvebP5PG6fgWcFZaSdjVASBwLBAnvtX1
         4q6jeIK5sSiK9oYdWosrGHkomYor2C6KTMmXpKhtOK5AoLQRmgjbHmkwyG0e+W9AwgRz
         Qvrpzn8Rs8GiqRT6LNA1gfsFOgQuCA3u7CEsmc6LrAoi9zaQlx4rP4V3MC1J9ieGTsk2
         NodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158680; x=1790763480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=;
        b=BZtCr2Hx+cEFwpIaSg33c6ob30eXqadn0bGO/ArSC86S9E+bqnCOKltV7hZU/3uD5i
         NAXl3pxFjSmMGZ9AeUd2SjBdlsB2Zy6nLagiWVdLukpzSl0+e70Bzowqd2SGvuv32RTR
         5RbHo5ER/TahjPnRkMeK4Qfb4f8VDT2jpFWrkS+k4AvR7fgRUMkn+jVdBFgfIxTh6e4Y
         +0fLZ+RDvPljMWocoVrPCkqmnvuG0suGh56Z/xLmZHo3IARl0HReQBuWppr5z+Jq1w0K
         52mL92Ldh6ugmJPG21w9uLeQzp21EfnPfpXwm3ZwK6MDZkGeLLA6LZNNOh1NNVbA/WDn
         meiw==
X-Forwarded-Encrypted: i=1; AKwUvBzDFgKiyEM1mpPfg3tlZ41fbG1mkYUAqb9n1TSXD2mfRtNyx+iUEaGZdhpmLZEVWmINQbI=@lists.linux.dev
X-Gm-Message-State: AFuF++mnH0v9wvr2FsRKBDLZ37Y93ue22g5qxRujECrD+HlnWUn/tR/8
	azsADmOJf3iD2KW2H63Ig5Z0P9bZsHt1M6zpL/hLAPFqRI/qstlBbs/rhYz00ORSD0n2Avqaew1
	Oh/YBqINz57CzJz1GSPV10Xs1+LOz9W2DfS3wON4KeFLhK8qnL1tz/bmTTeMgM1I=
X-Gm-Gg: AYBFou3zbE4Tpv42zIQ1+EVMZLOW5IipzTTFztiihjD8JtmjI1WDtG2MKhUjz0YNuT+
	dOdoFFRg6nsOmeqYle3Zx4PCqX7lxzh2geFZY4p+35F1y952vo6h776XVGI1GMQyVguKg4wINhY
	GUQq1HVerZXu9a+3PDUZ/OQifJqaXziZ4o9WBKKbzDTOj9u25B5YhEwoVvw8MYv9n99gUwdMQwf
	FdWI+FmlH02OVl/EGLQ31tVw0LoAIZE8A6iazWWp1VKwJpV1wVokKO8cY8OF37x0KS1x7nuSAc3
	E+uxfIEhasRXHpt/tTJeMIRB7cQLmxoNjxzJWTNM8RgvOCE7H4L8HFD1WEkXfrPDpZwocT/yhG8
	k6FDXOE48uyQvomTcteGRfh530Z/o
X-Received: by 2002:a05:693c:8005:b0:33b:da1c:9bec with SMTP id 5a478bee46e88-33e5ca9ae39mr2432337eec.15.1790158680114;
        Wed, 23 Sep 2026 03:18:00 -0700 (PDT)
X-Received: by 2002:a05:693c:8005:b0:33b:da1c:9bec with SMTP id 5a478bee46e88-33e5ca9ae39mr2432301eec.15.1790158679401;
        Wed, 23 Sep 2026 03:17:59 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:59 -0700 (PDT)
Message-ID: <e8b656aa-bca7-4a1d-9588-c082a4bd665e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:56 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org,
        conor+dt@kernel.org, robh@kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
 <20260918165721.CA17C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165721.CA17C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX8wkZwMB0wG8A
 /hJ1RW5/fEzFUKZ5xD/TM+KHxBKqdCNqZZ8W7X6SwUG7YGlVbxB5JJdzcd4FKVCBAEs90vAhp4N
 Cb3fKBt4wjf6H7fEBswpCtrH3k0aJRZjtxZuKcBXhIaygFVYLw0UlwnoGcZQUZHQyntnYkYNmX1
 U9+QXw5Bb2Z7A6SIa4uY4c2dqOqaRMk0nmRQ71Bc7uhZda5/nM0a4STaU0RfUupdjUEwOUEogs/
 ey0lD7UvgYGfq786ZJL9FMYIwb1SIL4Vo7sN6/9/igYR2xjhSE2YBgXvo3XR3I4piqxqqjrLJYU
 YB4pMV0GWkxld8ngm8zjfSWDzt2VEquXrWeWcRM6qfpZc08jJYYh8/tWFoFApARfBOvJSjGuv1W
 aKITbTlEvJc4Avg1iCOgjOixaqWLjDIahpww9/eDUmNlhnOGJI9bqPsqujhnddjhSlYowA3RaCp
 8huH2kMNmcEFXDlK6Vw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3a758 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y5K7N4shZw4fCDjzXqEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: IrHuaIzpFzS3MBUJr4toQoN6bdiojCZw
X-Proofpoint-GUID: IrHuaIzpFzS3MBUJr4toQoN6bdiojCZw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX3A15+sSq+ZIC
 I9sZjkdH+eviIFuj7bhRoarIHLogIGLT4nvEErHZifAI02GB/MBYAOlgdAmutm88GKnIG4Cd9Wc
 4Cebx2McLNWB56ofjQqzlcWLzXGp8ow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/18/2026 10:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client->irq is 0
> --
> 
> commit 2c273914596163e5696becde808ceb33d98f0fe8
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Tolerate missing interrupt
> 

...

> [ ... ]
> 
>> -	/* Needed by GPIO driver. */
>> -	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
>> +		/* Needed by GPIO driver. */
>> +		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
>> +	}
>>  
>>  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
>> -				data->num_mfd_cells, NULL, 0,
>> -				regmap_irq_get_domain(irq_data));
>> +				    data->num_mfd_cells, NULL, 0,
>> +				    regmap_irq_get_domain(irq_data));
> 
> [Severity: Medium]
> Will this lead to bogus IRQ mappings for child cells when client->irq is 0?
> 
> When the device has no IRQ, irq_data remains NULL, and we pass a NULL domain
> to devm_mfd_add_devices() with an irq_base of 0.
> 
> The MFD cells (such as pm8008_temp_res for qpnp-temp-alarm) specify IRQ
> resources using DEFINE_RES_IRQ() with hardcoded offsets, for example:
> 
> static const struct resource pm8008_temp_res[] = {
> 	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
> 	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
> };
> 
> When mfd_add_device() processes these IRQ resources and the domain is NULL,
> it falls back to assigning the IRQ as irq_base + start. Since irq_base is 0,
> a child device like the temp alarm will be assigned a global physical Linux
> IRQ matching its offset (e.g., 0 + 5 = 5).
> 
> If a child driver requests this IRQ, could it steal an interrupt from another
> hardware device on the system, leading to unexpected behavior or resource
> conflicts? Should the driver dynamically strip or adjust the IRQ resources
> from the MFD cells when no parent IRQ is present?

This sounds right, I'll make this fix in the next version of this series.

Thanks,
Jishnu

> 

