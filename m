Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658581;
	b=nLrmBAjJ629g2Y5w+PcihLVm2jj2NUt/Jv5pGKjapD1UKLnM3FMhIlVlpxLLV9UrYCcU
	 vX8MHHuRjIJBcI7ezlGKDyoBK4fj/xiV4oxDY3eKpPrFgp0MDG0HJ04u53JaIC+tNnwI9
	 DJw6UxqMhUPgkWJ74lPa7RSTU5qWxqjKovmDHGqe0kP4Cs/m5JL6mwltXNfdw4qRygIq6
	 AD1tb55vm/CEQ5Dh0vvTaluGdsyRk0KZutohj8LdzU+8L2NGDaHLG+G1S2OG93uH9RWHl
	 ysYAeGRw86jfHvwVRcfTelQaeBvdzZ+XbrnXny0tAZSFrum6pNz2+87JHARsf1MR74Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
	b=ZRYJ48wNgr8PzbIcFPhBKCdvTphJC3xiwDej2+i+w1SQXH6DeamwtzyFT/znJLOXOyFU
	 /UZFn9q3jjHtEwXQ4QyIeU80wLG7PprOjk1es6EOjfqkZSIax1apyhNsqGj6uIyAz9LLH
	 uhtWqtmHkpQqu0JiEvSaU1Vvjg+IywGzbgK9xLRjamD/UKHYQiU+x62uHQZevZx/u6GAA
	 cCUXdzkXg5apL0/F9rqHqZFyXkS6E2D0Eim08jp1/+FQ2s7T00bPn0DFZp4C0abGKkvrI
	 kaj6JuClTTiWGw8i5AScqZ1r1s6BpYwmOw19KMjV2n116kWU82pd2dz1H3VsLDiiQIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bp9R5NAl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62962606A326
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62962606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bp9R5NAl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8esvk3248258
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=; b=UCSGe98MnsUuyhDh
	cA4uW5rR5UfdQpzTvdb7KUu6cDh2Hmxp88qSgVTeaWnaG0yqed3z9VB2MdSfDRsq
	+yTRKUL2p5PDaPOe6cfSQdLfGCUTsJe0gbtZWp+/h3e7XTxmqc0SqFFnnHEcdmbF
	WXjgCfFgYoWxJr1covmyXjKMvaHEF6TXRbWgVuwAw3cgZMColKh8Qwff1DQjYX3q
	D+kMMoeSW5v2DBTAu/qdXd/JEJncGxt/vwCzQ1kft4K3PWj1gjPv6NH+PskCJMmZ
	6tZxgiyZK9/ttGnh05MPuQyBBjZ5D77xkVUsK5jyU80XDl7hk+a3CtCI0WKogg8E
	ods/jw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asf0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:42:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac76132001so1328388a91.0
        for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 01:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658578; x=1793263378; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=bp9R5NAlC8+a19PI3vWnPHwaVzLgwT37azlq+J1tEW5NA7RuTklBHkxTfjwoU//BeU
         wqEeC1+jTPppgT05kzg+sm1wmAljLUgXwIto7sUnX/1ONLrWJWJHQpZzbIFzxfv4Ad3A
         mAgsqB1lSrK6xw6uh0jiAyILqozdVaCumrby/MuPlzrMOx5piEsxf6x4Ose1cWDOLmpH
         XorBa1oxbeFOY19rHx+5qNXuigyuUd4S9KmWynzE6TfbC136bxWpRjoPtfzoBCMompC1
         S8al/CtIhfc+X264EuqtURW2BIdWOi/bt3bn3ziddTs/u+AubMFxRW+2D52aEbAVxgPg
         6/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658578; x=1793263378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=s0aAwMMZlqzwerabzIkIsvlO1lkmWwe/IGJ+ETI/yoGLwQpi56K4woaisF3X3PCD3j
         kn8q7JUdmCtM9GP6oKRFulM1xcNa2rc4iLh51MUpjyKtm3lE8exaqhnZRlkoC2OWRf6Y
         c/HXJ6q7zgnbOlfVQfqkR6pZmeeLoEtOoQ0SoYUGx34K6GPNP5S5/0tG5Pk72uOi/39m
         q1aJ/0ZtOON7aqyCTHUNjq/fDk9bS21m3hdVo8Zc/jIF/NVZR3Tp/b33nBv8rs5pIn9m
         VPEhpddmS0hqfgp3rARR8oakvnzVIUVDbcj78z4B695A8SPw4D3GPqDO9BflGxnXlzlL
         l8HA==
X-Forwarded-Encrypted: i=1; AKwUvBwYqf/LFnM+BHH1eaPQwQgHNeoIh1EeNmm5cJ3jllWPxHhPdsLXR+v+92v2GcO2m3qoeOs=@lists.linux.dev
X-Gm-Message-State: AFq9FYKhSuM8ezJ7PG34gefRYeq7KsNpMMdMefLtCAybouBuRG+SvhTh
	Z1XU9KMtFdbLGN9m7BOFsLBN5ECcL3um68e1IvKqKiFEtzY2HxwobaHHtafHZ+GnKJoVD9z0Xyz
	pdNsaKk7fKwTxEb26813Kk7JvtuS/0MDQdaW3V4GB8gNpS5YN0cwhbwo=
X-Gm-Gg: AYBFou3LZd1dboQTWyUHM3456wk0NMk6jN4OaIH9Q9cqalVUKhq/28/jBqlsf7eFsRO
	Zvdh1fJWN2UjHmcNYzD+deG9qwrz+FnPvdgC/dcIpUWfU00cxp0Emuy+KmDotLLtVSjjcllMmKE
	e69pCZ2igTPPV8HO6o+P6JEChCFQYu3OhU2qmDLGgYOuOp5yml71NWi5rb6ImBmdNdKR52yTnaj
	wuDO1cpJlbQEhgxU3sQzBvp452UVlb5Z6tsMceN/YSnx0If9YBTXtBAM7bjo0R975lYtNKL/JuE
	8/nbRBoq5t+BhKxl4lDdBROOH2FfEJ+Vfygudg7uTJHgT0ffqr5R7XO8v4F5+BAPUFyFu8fpvMH
	Ux3w1X1c3d6JFYGvOZMrNgiwwNMSO
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524484a91.18.1792658578412;
        Thu, 22 Oct 2026 01:42:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524466a91.18.1792658577942;
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada47f8ff1sm3380433a91.0.2026.10.22.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Message-ID: <6f7aa923-e67b-4bd5-bf8b-085623d094c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:50 +0530
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXJp5ct5jANeo0T@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXJp5ct5jANeo0T@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX3Ee0rK5l9GMM
 pnZ4RX07YetlUX20e7o3obgWOdliD40pfKHOk/wL6lRveAdFwAIl4zz1kDs+5aTjDPzLYiFg0vN
 Eq1+WosnbdpCPT96BQRl4udkBsJtTka+NVo7FMR6/nRKFHktZUau56AzG2IQuFfdm4ptoEtJH0A
 62Hz1Vxt+mrjToN3ZA77P4QyikOJ+RlaVnvze8mjc7tgdhH0ESqwb/uGV668BVHrNFjNmBY/0rv
 GFuMEXn2XWAESubEtAIaTvDjvjYPVqPGE7bF+ab+Vn+zdO3kVOwLmQ+7APGZzwcrpON0iCUr9Y1
 yLymvtnGvhxEkj7c/e0bMdvTyHZPra1BJegGXlSqI64K/Aei/5bGS9aB/tq+nJFNYVm152JPgvh
 EK6ATgAKYI1tuuwqI+lyMi4w6rklIisB4J9K9ew9vjNByoq6qQs7Mmjl4dDB0u/X6Yn4mSWzg8W
 pqlAtrlBKk5Rvfvvt1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXwgZH+i4h8MfQ
 8SlZOU685DRek4GBfa29I9Ld3BE8ic6lQuTBlIL3bqdflu0nO5iqZ25R4DdeGJBUBP0uJ7Px4RE
 vLghd2P1zYsrxBktcBR10LIBZP7d/2s=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9cc93 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: R-lGNvQ-zwypKEN6s-OjjAetVFUoLGb3
X-Proofpoint-ORIG-GUID: R-lGNvQ-zwypKEN6s-OjjAetVFUoLGb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:11 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
>>  1 file changed, 74 insertions(+), 1 deletion(-)
> 
> ...
> 
> Patches 2 and 3 both say "Add PM8010 mode support" in their subject lines and edit
> the same file. Could they either be squashed into one commit or have their subject
> lines amended appropriately to better reflect the changes they are making?
> 

The difference is just one word, patch 2's subject is "Add PM8010 support".

To distinguish them, I'll update patch 3's subject to "Add mode voting support
for PM8010", I hope this is fine.

> Also, patch 3 uses the wrong subject prefix "qcom-pm8008" when git log on the
> regulator driver reveals the convention is to use "pm8008".

I'll fix this in the next patch version.

Thanks,
Jishnu
