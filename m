Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850247F2E6
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158685; cv=none; b=Lxgp/u4X4oAgnaGM8dPDauhwIOyrcKfF/GmWMFu/twMSv5k4EqPv3xKiMdRyfWOES8mV6OjfK24hrgHBQ2Z9QWFr57nj3eh803W+yn2wZtEq09aGCUVYwZbNOnpNrceogOxmaQ36/mM+MPTZjVrBcvXc57XDBI3j37vjeY5ED2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158685; c=relaxed/simple;
	bh=ZHN4Tker2MNfZG9wdoWMQcO3v8MZgFM+Tpk8wzrX5D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a40yBWWCQr51ZhOi1WPasU99HLzMMGXzPoCgwOIYzhVJRSZEtn+KxhR2+yC7NMUTh0TYXez1Il2WMbHuoP0ZNWb0v0UKviUHfffTgWf413skc82/A162ICTkJifDvv7id+KfyIXV3VCdaHZDzQr2ace5FvfwhLY/RhuHietjcXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6CKv2L/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNpFUxxO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6CKv2L/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNpFUxxO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2vIj3409866
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=; b=R6CKv2L/vSZ23Y2S
	y8QgrZsB8TjZu4aYpdzGVCKF8HKl7lehL7ukn06mgQUVEGRbzC+WLyYExsjhSO7j
	qv3N5TDs2WDt9EYfh5M13VubtATAUzHlyFMuHtLoown2f76ZP1bQEslvu2bDeYRF
	fvOItzmqY8faf7vJOjEpbSp3Tdy+ZvacXFQjDjq741IU71wPPMbGPuZ6YkXTyE8K
	9Nzdo507FlIXN4EJ6r4E+IWEA2TDV+PC0mZPOk8sE7v9mvVl5HTzKOAchjKnOw9f
	UdU12hQB4pltp9DYeF0TtopD0oi5A/AVNvTFBYvKytZtPShWZkPYIpPcb+hvEy9l
	LqIcSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux863unp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso1294924eec.1
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158674; x=1790763474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=;
        b=kNpFUxxOHZuSOounnPW4gqEU03rOxNHE62wU1B+yCx3fPvGhTLaU7pzzzWj/sYTXa5
         MIitZsZhWqadBdMs4+bk4uxa3jabo0eIX483GlJbexO2JDd9yhGx5+XGEl/h1xdkrmsB
         qtRoIUfexQRwLO/dEerLTKhDtUaUCtzorG1d0v7m+/xK5OmaxJRxHTsyQkgnj/tHZ5nP
         hVISlISlq76gNPsuh9aOws/gjRXlnNpAIWfKtb2rO2t7U17OOeYy0cP1XnisOu4DHD7J
         oy5D5tmAvZKIBDXFDZt/8nc45+7JLZQqPcjvgAxvV9j2k/rIjGHC+USwZf43Q+N2qQB2
         MXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158674; x=1790763474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=;
        b=WvPUZ08MY/qs5bCWo2YDI07RbQHPaNIEddNRC+145fyqessqu8CYnVHA2W2u/0oPan
         Jb0oPQj5cRB9s27CV1rDdxgvb4/kxMDHvMoExMvRDYV/aiCgCMpfzEQilGHPERyD38YK
         auuEGPlPFhK7+MH1rrV2GWNLO8LrULMqOhSiLasUmtWT1EsS+0w4VvbHXf0zRj4BgL1r
         U+3u62LZkyJvDfJ6G92EgbgYXoMK7qBulRDDI8dQOnA5v1brCCBfI7MSr0zwhHpokiMa
         +ZGJyW1PJ0+DeOrBh0Bd3DWeaFWzXHgLvgfC0EnXXnEE9xs2y9qY3GhcWNHWM/yrJC9n
         mVpA==
X-Forwarded-Encrypted: i=1; AKwUvBwqI79rjywxAyS2Wd9im6qwj/6EFEEQDU4nBv66QHNFnJLJhsmeNE4UpQ0vobgifzdCYzk=@lists.linux.dev
X-Gm-Message-State: AFuF++nce4aNYNWIIh5bGT3e1anZ6nTuha6cGP5ua6WuhVtwavBWb/Fp
	mmHrx66aWW2JcuxxoM7t/KjdOup5wlDLlGtuD9Seoae8d64Uba3EvWjJcdIiuAjGcddN2aWTcW8
	l9fodTVNFxwFa6XCREHrEs0VVMu96gM1629/QosJp2QIB7DGfIxBFJNA=
X-Gm-Gg: AYBFou0J3zl3Af6UeY/sVE3jHY65j9QTWgTLMZVM6BueS3our+D2qH4XS8pOO9rkUXB
	+jE1BDsxqlOochmUxwOl73G8RvzaDU83JC8uTD7Y08jfdAYV/0OvAgtlpUdHxV6PfE0eEz/stjW
	r5/hoU54j2SqQeuaV2V/aBV1JEk3HeH42DQMSONM/wtExCjN5pc1ou1q0TqYkHb83tym4ZuMmoY
	Bny18wC8wbi4okdkjsnzUrrkfMXguutfghQP2Yvx7rEnr0YRiipBoDKIBwlyUZGjhaojbtHEWxO
	ZLqmjZ3zObomb16G5SVvkdAWgR/dStNiYIlJt6tFy920J7xt5RkGncvaUHgpWKqhcBBd7STFUg6
	WCG5ge6+v58cc2S9rFq7nY5OqA+Aj
X-Received: by 2002:a05:7301:3a9a:b0:33b:b3f0:fdef with SMTP id 5a478bee46e88-33e8c05ffe5mr2124572eec.13.1790158673624;
        Wed, 23 Sep 2026 03:17:53 -0700 (PDT)
X-Received: by 2002:a05:7301:3a9a:b0:33b:b3f0:fdef with SMTP id 5a478bee46e88-33e8c05ffe5mr2124552eec.13.1790158673077;
        Wed, 23 Sep 2026 03:17:53 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:51 -0700 (PDT)
Message-ID: <41063e57-d8d9-43d1-bba6-f17f667be867@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:48 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org,
        robh@kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
 <20260918165721.CA17C1F000FF@smtp.kernel.org>
 <20260921104237.GB2348773@google.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260921104237.GB2348773@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0GKV71nehLhjiKGfugYG7SEr7qnSSIVn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXw9YZc2MLItIu
 0KeF/rNNL1bwYm4B3+8zKgcbriN2jfyTExrVc5bPsPBbCQka1h8Nrzkg/7uXA/iK2CSoGXnLxUp
 Smh6SJi9dpI5E063MEwmXI2sRTe8IrM=
X-Proofpoint-ORIG-GUID: 0GKV71nehLhjiKGfugYG7SEr7qnSSIVn
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3a752 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8XOFi-LDWgCnIeRtGYwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXy8vpxpXxAN6J
 D9nF46r06zHvVjlq0qaSSn/deCI/el6TZRVlq28DSf0UFzjVFKcCo2nqRlOCV4dImZR4vtWohTA
 yARALZgQWY6xdk2ItCE/kzpQd1/hPbcLFw7mx78qCoaAvJsjMPr8rlvhg1No+vz9SdWbqNneN3c
 hrMSo1YbF6uOKmS07yxbys0J70F63G0mQUTL8D/pkbsvcppjB3NENScrD71t4smkM6I2qiVXZEd
 odNIw//NWGWpgJHXhjWZlyo+R0yVJ7FDW3Ps2qYeJF0c4fV2zGMRcRk9frxxgTMVPh3baBCRYyg
 8h1qAPKfWYwqhQKoDfz1RPNTZUyIwno4EcTQjGqNaol0gnCi0WLz3vxOpyxy/J70CHvoUF9FcCA
 qebTzfIRVeiNFBralLPjwXhH8/AV/Xn3BN3czW9qpuNDLd8dBlv0sudtOJs/H00XKKa48xwTasQ
 4cIBtex95OulPvlNmbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

Hi Lee,

On 9/21/2026 4:12 PM, Lee Jones wrote:
> On Fri, 18 Sep 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client->irq is 0
> 
> Please review, explain or fix the Sashiko review(s).
> 
> If this is a set, this request includes the other patches too.
> 

It looks like the Sashiko review comments are all genuine, I'll
fix them in the next version of this series.

Thanks,
Jishnu

>> --
>>
>> commit 2c273914596163e5696becde808ceb33d98f0fe8
>> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> mfd: qcom-pm8008: Tolerate missing interrupt
>>
>> This commit modifies pm8008_probe() to only register the IRQ infrastructure
>> if the parent IRQ is present. This is intended to support devices like PM8010
>> where the interrupt pin is tied to ground.
>>
