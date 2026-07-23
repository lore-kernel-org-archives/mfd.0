Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744253803D3
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792420; cv=none; b=jR/C4zzqW4HfoNltZNBuHhm0TPPksQMeEGhfpOrV8Ezynr/wuB2ImhJSyJlVI2G1uubDROeWcfyx7bhYNs7SiZC7k5ZN6FUcjHwjkjJDgB4SRGurY8+xlrlGShqOvgvjZIcQcgmQppCVP9uXHlSBpZG5oOqdqskMxRErtdNIsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792420; c=relaxed/simple;
	bh=87kbs2npqcqvfJFySp/OWE/pJx7RjfrsrY3bV2Ot88A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSmghIwwrHFZP+X4DugZXdAQEfJC220BDs+dFlgb+/b2sVOfSw/6eJ5YYMHz6ZzrS3oJBaSMfs+facljEEwabWmTWLoWFJRTjdaurFa7yHxkmJmDPgsatRm+4ffSPslBN1swMJWm9V+k5KIhwhjnk6GfEo5a24PxodJ7CD1OFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbkpRXVa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhuttcZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbkpRXVa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhuttcZS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BZHg3372207
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=; b=gbkpRXVadTWyCcVj
	s7AMcO7zkK0PWvwy6BuzZjeetuDFHMozlpkN8PdRy86J4tq7P2u9w1/6/ww9EWuc
	hH3xNV79Y78tUmtOB5DnZgde8J6mctvJXwkXdGBrUZrk3wEpFGVy5B70IpYBz/bz
	6O8uw0GiMEpUe8zgX2djHCeELv+ieaPHaGFANVURZj8UuSHyTU4bg8MNUnd7Wl1c
	VURN8BKfL1bV0OJuxnedHz5mM0a4l5E9ZP+FHQIwLI7HsnxXk0/dmePOWX4tbxw6
	H4vZ4hkeDk3sXBet/7B/dsFL40TvCeDC9kRiPQXt6Tij4mD94eJZKQKznUtV4jUM
	vVXX9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qg4qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 07:40:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso7350185ad.0
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792417; x=1785397217; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=WhuttcZSixBeGHVkBOezsYkBPUjiwcb9+Sg3Kpk2kWcrs6j59+xCZjp2HyLXb1xb/X
         lc2WXDHsfiv594aJVWukV7GBSZ34wUxpi7BoVidnuPswpNWw6q1ZVaHrxNsv+VMSj1rf
         tP07Jby6V9Kgp+50Ju129gf9UgVAtBdhQm1bM7nUu90EzdJjnc9qdfdcx/B24DA7h3hy
         +G3pQiAli7X62cga56l2p0O2//q/TQTK6NWT9mnKREkk+ufrExiuEBfI7RGb4ZA1s55K
         xllLgPsvnN/LK4tsPj3xFwKBUEDQ0MIbphcnCVRKd1k3hJZ1/5t3cmOm7z7GbXR6GusA
         /YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792417; x=1785397217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=li5lGKjcSRnhwCTvg7iUGdeHq9h7P85QmgIRnaFWgYo9arossLxo+2EOy63GYsj5NT
         810Hf/GGbjmn4fUiKiYDcfWb0CLxpL6QRxvM2zoOmnHoJcXKkyL9j6KID0Irtb2mQHHM
         WD48AqgU9yA5f+JnJWgyxHuTzVY4ZeQSxCwB+PXDEpNw5gEpHCa62pg15BIG5bwIZSwB
         pP13NV17IL7Vpb7fVxLG4KheJ5/1Qd53pWIwIvSscUskV2yEalciqr3nZrSnuQbrU3Mx
         NPDyhCPk5+rZ5ueTrqhltWI2BU3fLu+WNCqKs7K2tzGDL4wl6sRJ6tajmgchDKeajf6W
         ziMg==
X-Forwarded-Encrypted: i=1; AHgh+RpYwIt4iMeuIjMtRJTl9bUL4zV15F0dVGkZ88WxOFW9FXSvUdHm40Wrc9/3Ueu1q+wJ0ws=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDmB9l5bH3wd/3bExQWac+sQr2GzOsfxNvTmk3amhXpN410sHj
	HMYViuCbKViH9VBB8y8PEA240Rzqz0b9Ci9EoEUDhIquiX/oOfp24iqVqFl9Mb9tq5UBOqxg9yZ
	vPCZAPmElB8biOBNjSqOasxCefi5mPlQ6pmGYZCiz4ltkTG8FnO8Tz9Q=
X-Gm-Gg: AR+sD11kCjFaI0+PisNIL/fXF1vmZzZ5dAmm7lFEKT4086tdASUtbEy1zjvxiOJf0SD
	vchMacUGHzQMRKNv579cXM2UQIgn4+tt2XxBR7a+5xu+MOg1CeAECkw6yMLS1JGlOtM5K9vbUpv
	iqKvzq/UKnh+Qu3MusZdBWXY0ZVog0FqhMayz6XwkKp55k0r4hYGenmalnrZRp4L/KV13H4L70B
	VC0P3ymckjQ9DTbnt10g9hiiBrRzskc2PfjY+tkKqYFjWk86817hGJAMUtkYZoJ8vK8kpKsd8V4
	K10f2vAyIiQxfwen2y6BUO7mHAX2PHQNX0WGXCpuynQUfwYw/4oG1BpUFOuqEWdXIs3/TZOk1Hd
	LRck2nfJiZthvjz0/xLDIuoUW9pfOduJOsg==
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584805ad.16.1784792417173;
        Thu, 23 Jul 2026 00:40:17 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584415ad.16.1784792416640;
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Received: from [10.92.198.88] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd8a9csm28597255ad.30.2026.07.23.00.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Message-ID: <1dec53f7-53a6-4905-be0f-96c3acee8938@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:10:10 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <amG0f57O5-e_Qg5z@monoceros>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <amG0f57O5-e_Qg5z@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX7zxhoJH6RiWv
 zbmUHzns+FwuwXr7ZpKljrkbuQQhN3CYWyqLUOBiWlxu4OgQLjNKjQNJf3Evu0idpE3Nw5KQAac
 XS3Y/YqzLZtpQi7tJZFnh7bdtXDFZIc=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a61c562 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=BWQAxAc5KOlRlpeuKSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: QI-uE6qjGE3Jkwu-_T2LZp7EGvdmRdqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX/ltIOVfKTOkp
 MCXpMz5G860FlCJgO0e3f7MbcubwJStRoMhcNkgmCtbeFB7bDBJX/a41ipnBQD02V6UB+zLSpSf
 484DD7zrTiEzkhuIDpbsWKHZPlTD6uoCo+6ZeMxYDskJpOJenmtt6gEP9chg1AEWN1uxGU7/Lmd
 lhZkuhUNKgJ7sZZN/ZgyzfQJFSkvdxUf/Iz9hWoIqIDieNYmBe217kj5UAsFU+EO6ZVffDpGOXM
 k99ZiGy+PIDK0TZMRAis7orR6cVaPSLvY9RF7iW9yp8tO0ebXB3PZCW/mYpNdysc2HTwdGnwPXr
 KFHAfO2K//Pa3CPNchrNgjdgT2IvyfSQ9YXXr/ehGalCk83+n8Bieq9PGI5jtkB9VjIJrk9pNPB
 qvmxUzEOFeUV2hbD8sUwzxsxwHaZj22HH+xE0ghu41+ps71kLtUtFTR27q0dGQTZpqUukW83MNA
 LEnN69MvZcFzLn+A+WA==
X-Proofpoint-ORIG-GUID: QI-uE6qjGE3Jkwu-_T2LZp7EGvdmRdqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230076

Hi Uwe,

On 7/23/2026 11:59 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Jul 22, 2026 at 12:00:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides struct of_device_id and
> <linux/mod_devicetable.h> will go away soon. So please drop the #include
> for <linux/mod_devicetable.h>.

ACK, thanks for the review, will remove it in next revision.

Thanks,
Manaf

> 
> Best regards
> Uwe

