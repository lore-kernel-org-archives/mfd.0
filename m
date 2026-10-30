Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341023;
	b=afKquzxetFuRmVmztmW3PIdxPgCZZUrzbN7Zs0V/DXibwbUaHcbzRC1R/8RAkdIUMLXJ
	 6oQ21SeA8PwCH1DuQRijHXBAtBGisVbjxjNn6xov/o2DrzxDoW1y18PSnaxMmP2OsNY21
	 UWAJ3yyI2flIjJuLtUDx29vSVLTW8ep1UMkPxowXUPFGFHk/YIRntK4DEBNKPMXuoXhC5
	 IMcbJ1HgHEAcBA4Odekp2EMKpCRicDrLmrETWXtAXyBJrNgBvUl7QeBEwEvAOqdpIg0EM
	 ezzwwaB5RqBxEhFvZ02RmaYsU5ysJzi0/ZrGE1/BUrhf0rfukQd+ULZ0R6oIgDatmcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
	b=whKf3CB4XD1LvOG2LZFNCx4Us8KYqv8wzgOcnOY6xJz47fBYILHrORYBry+ErXbhOP9l
	 o5F798rdh/wIfmn+92dcs+0xeDj8ulyscGASWQmIHIwMa1qscwWEcKdRQYqZwpT/FHYvb
	 dNBxpMag95Qs3IsQLq1nLaEyD8qN8xO34tbXUSh68SFREZ7yjcYFuyuJXqvyDkIWmJtp8
	 YCCv2qRCjOuxvr/0hZEfPotjwkUBVClaFkKK2+/kJisact7YtadRa1a7buOPjcv2jg8D4
	 pEyJIfXV+kHK0mG/iIKSUOujXrdRl0Glpo7hJDrK1x1p2RrCHx20ff1FSy3q2aHz8aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKepuzNE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMQ1m5zw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540E606A321
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C540E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKepuzNE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMQ1m5zw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FN5W2913585
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=; b=iKepuzNEyWv3/RyV
	1XLY2KoJBHDLMSjUtFUhRhbnDDJRywYTxhSKFHe9vyAN9wCKrGFLFPCHfnxslrBK
	EQTzRMQnRRrRuYcr5W6+1SRLPMlaz0th9iTHgMX0YIqxdLXStaFfSFC0a60lzyv3
	dshbvtud+EKT3qrLKWz34Lfdgi39Rm1OLkFFMAxqOFeA8ETuLcxXq1LN7lL+RdOW
	UE4a/i3HAQknXNaMYC1G0o4j4IDxdu2sTiR38TNC3Va3FHZ+Wow2RVgxvrcXND5Y
	I7JetBFnKuD/SXfiESiDbfCJKaAkZVC+a0O+NdnhaTelRHML9nJhm/gVCMovBTMf
	ZdI6Aw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qsgdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:17:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso897610eec.0
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 23:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341020; x=1793945820; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
        b=BMQ1m5zwNUdwbbFFGGIG/NF3wO0NBWY5Baq/ZM1bJmDluSOooK0DsWiHWjLLKyJAxn
         CAK3kq7FRZv9BxNBJ07nplpqE8xJvLHZr9tcyLwW1PIKBd4M3KLOohxWWaxmNTWflSep
         Au+52Zagqq/xChfYcx6hSwy95jjPAri9SSdZ0qyDjwyJMkPBFGQS3mtw5waKkavcVqwf
         Lf9lJUneXlQpk2XmE29bdSShO1KC7UoYg8NK74B71z008kjwxxs5m4R7+HrrTJAPBi/w
         TeEFLeX1MxtelX4vo/a5C2Kry3coKTus+/8Onq+rXlwykhED5GMupScG/tNEAdpTSKJV
         Q5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341020; x=1793945820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
        b=Y37NbeS8nOcSIlzEAlPImUarXQiR3xMa27ttmaLCqBPpTxfB3cPm61a6P7E1cijHtL
         NT1tpIPXmflulz8zCtYPSyIrO8C6Q/3sqhHzu6FW3LikO1YU4dO1aePZiP0lbjM6WrY1
         R/VxyMtanJ2aRQWlws0euemysXN1hJKx4RIIweLjTj/zQ/01qaoNBi71l5VtxAUvUmDE
         8W6FOEwR2rp4WTj2XcJ7Y9oQmTh75iRHCb6YNSRgQSkVHy6WhxtA/rPg70giMCu+qZ3a
         MPL91+X+Kx47TRND5Ds6yVXeX+dqI0pRazf2qryVdnYtyQ0jiblsr8gGSxVeTBf7o8Zc
         If8A==
X-Forwarded-Encrypted: i=1; AKwUvBxcfhwYSMJ/6AKuz6OUz7Tq8T2sGd4lo7ScX91vxbbnnnY3xqQkJZ7Qkse4za30GLSuYos=@lists.linux.dev
X-Gm-Message-State: AFq9FYKAh2/6baz4EgU3LUR48NNGeyIRnxW8mJAeqwl7UCgdxz1DZ3x5
	E3ebIr0ZfMQiVlHnWPZLA4lz2A4SlCtwU17771bLIf1MwJF3D7rLghkDj8EbGP/0CJPkR3bw7pu
	RZwdDqFHsaPhtNXa9iHiE1qHgUQRQvzcMaGmt6R30Z3xmpwkXVfORPGA=
X-Gm-Gg: AYBFou1+6+sbteA3PpUliRYk6j4e89wmuSwf9U0IhYzkhNATZKNWN93hgdCM1oce29m
	q5/Wg45L1wY8FuZaA0swQAfypvjHPJBpFMgiMeZMR+k3TbUUeZcfMDyqus8YO8yzUyJSCqTXsGo
	cSw2DPqa5NSgbgfNywBu3q4Li9AD2wUEYDXJwraUevB0OI3oO3RBUCWnLCLgi82ZRiyrPCcBT6J
	nj1VVBVVIHc6iYBkKlLI7CKijpSrAp3dd4sLQL0rptvyzozDMR3NCUxVaKzcrv2aZKCURIrJzJV
	A7NmfcdFSDKV0ckub44GxYLHKJoTc+sJI4MqLRBxzDsA2sf9b/GLzEesmGOoYy6JyI5y5EvKBEg
	FUKLSHxVKjPhTxf6wjHyNGb2opzG2ea/TScTYNeRWQUB4eAzwjitLPNsncUrgjkmVm1JSHK0Vp6
	H6ZA==
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr2308075eec.23.1793341020126;
        Thu, 29 Oct 2026 23:17:00 -0700 (PDT)
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr2308041eec.23.1793341019611;
        Thu, 29 Oct 2026 23:16:59 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm4577341eec.3.2026.10.29.23.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:16:59 -0700 (PDT)
Message-ID: <9dbc3e69-35d8-441a-9cc8-87a1e0355d1c@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:46:52 +0530
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
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
 <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
 <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PEKUNQyDW56bepRBwbUklKSJz-NArTbD
X-Proofpoint-ORIG-GUID: PEKUNQyDW56bepRBwbUklKSJz-NArTbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfX4G8j1x3/P2v+
 CXJhoTVXkN3nA9C/AUSlRn2kGNlzdQhmV4JIiZYubHBlQCG7qDnxHZpDW7KGKnx2oqkHPl2HFIo
 TiOBHhAJRLTvuqkSWe01169aqjPf+nQ8fc7Qe1Wp8+6pMy8f2CF7NP+RbPXCM9cMe6dnIp9UWDi
 8MuT2+fT1PC4AnNmz5Gtu2VblUi0l7QT5h5m/IE3zgf9oDOvMA0lSJIqswjwpsvAOJAdng3q73W
 401IIA9xHjLw4oEcXFNOKqw4F731UBJIJN7UXAx6QoW+ktvKGwvbAWFZsoQNDvl6rnzimjFarOP
 zTdDkQ1jrlS2OO3oprMBDgTFPECBVkYxZuFArAUYf3ugBi3/QrEv9VGxBzTdkbmZxN77fw3va+a
 B8OZiFkjY8eGVqI+V1ICarqU6WY8V00betuN/Y1hhPHvkqfGwjZbjIgBtRGGqQQHgROaxPtUupW
 Fg7uukhVxTbIjIaIH8g==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4365d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FUarkfPcEUWQjx1WGoUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfX4WM3KgdLi5A9
 +6VxyKLIqOJV1lOtWlsQ9T9oKWlJKBf/ruE2yKXEm4RzNcDWjCIimVg0/dI5wpQqU0tVM1at0/k
 i5OltztvQBiVsH1EDQlVgLAxkLod5iA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300024

Hi Konrad,

On 10/26/2026 7:42 PM, Konrad Dybcio wrote:
> On 10/19/26 7:01 AM, Jishnu Prakash wrote:
>> Hi Konrad,
>>
>> On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
>>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]
> 
>> And another point we should note is, the MFD cell name
>> "qpnp-temp-alarm" used right now does not bind to our temp-alarm
>> driver and this was intentional, as explained by Johan Hovold
>> in his change (mfd: pm8008: Rework to match new DT binding),
>> in the last paragraph of the commit message:
>>
>>     Finally, note that the temperature alarm and GPIO subdrivers need some
>>     minor rework before they can be used with non-SPMI devices like the
>>     PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
>>     rather than "spmi" prefix to prevent binding until the driver has been
>>     updated.
>>
>> Since these changes are not yet done, we cannot use
>> temp-alarm for PM8008 or PM8010 over I2C for now.
> 
> I read that as one more reason to shave off said diff
> 

If you mean I should simply use the existing MFD cells instead of
adding new no-IRQ cells, that would also not work, because I
added them specifically to address an issue Sashiko found in v1:
https://lore.kernel.org/all/20260918165721.CA17C1F000FF@smtp.kernel.org/.

They are needed to avoid assigning IRQ resources from the MFD
cells when no parent IRQ is present.

Thanks,
Jishnu


> Konrad

