Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023955;
	b=foriQv3Z2NZfHuraqmT3Z8h+sPGkOcIYDyXq8jNeLrq/OCZ2B4qGSP8cNPyTmeydVwAt
	 cIobvdtfFuxsJOgUSqEgmOOA0WVHFKbhgFp4/3wkuyfFHPPNfz5O2U8iliOEApndPMoUj
	 P/pGdcXiKbcEqSBgYGVHwcngw379DaPXG3feLaUzCZzh47snFAEXoRuc0inZYiQzicBIK
	 EFO60tNWBRYT1wGczn7afhpkVNVZ4Dumx4ZU3/rZ6QO2Nqj90fOP2NUfYF4Hoqx8sN0qC
	 OrCUoPrs2IyAsfmvDbzzT0Vbfouh/5udkPnD27277ELVVKcjonFzJlELeGX1vToz1zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
	b=geBXhV5HvCkXKvmthhHLwdnMxA4Kt3HzTuVTpdG/U7Tm20MEInFPJ1owMQIt6P+W2InC
	 hLQMaBu+dJxlyFqmSpngn5FD5BxRpJIcbubTJxVDDxPJZUuZOOpnS3vMXMbZH6n9RcW1X
	 2q8quGVbMybvN5fRucrLftcCq5oxGPLF0rYmy8ackcF44GDXqOhEwZgxSh1uKCjkQrMZf
	 I7qBuJ2ysZ4crFYsuy42LI41B6R1xwEphmHl41g6yAjFYyjQncCMCjDENTw0QNTGMsS94
	 lZoxd5faCiPTVhodXcFUEzuciK05b1TNV3BaVX2htx6IoWd5zaPXFAXaZOtruCmEbtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aW/rSEBc";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2382606A31E
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 14:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2382606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aW/rSEBc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtD863633582
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 14:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=; b=D10w3nIpFbkWiha/
	pHUGRcHj1bLSKe4AoVHQsMWsh6p1u47njClYFwQiltaQWWW6Dm0B3YeDkSQT6uWy
	84srggUKshvtPGri1NjFXY3pHmuducFV3fS7V06NTH9RGs+HVzG6CqU5EEOM5+3Q
	5ZXk7oAWsN72nDz2qRNRjwSyQgSaPhD0zg/cz0HK98KTyr7B8BeyTzKlyokhGatw
	4GSbKNE+7AyME0V7MoHx5XGarCc4juZ1IlTP8cypOPuCHfWVZkIC1lUVrUzqpdci
	nJHeHFqffJJGhHPFT1aVG5MyGcyyCpijvgrPzLXrR2p1/texYRCoNfpLFbMj8jUk
	/rgSCQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0wa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 14:12:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9909853d264so140861241.3
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023948; x=1793628748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=aW/rSEBcq3M9Iv8QRv7zRrkxIauaCu6ZPSgCWTOJNXhuDGW+crNdDNCd8Qw1hf8xzP
         FIadQyc3y9KDtLeDm9rtsdUvXNvD0CQ/sNtg+DzRZ/Jn+xu5mvQOlViPYpNYn4B/UwJZ
         6hI2P8Nn6XhHzMVXpqVEZnKFEyAjVnzNOwjLKZHNZMp2p/HX/QoW+iOfSdPDTJvA1s1g
         LjTHzvXNjCeUwrAqy+fl6M23tvxZZU2b/gfAfODnMtzgF/XujzOooq9jWjytG1zjLXp9
         G7SMs6Sep2JElY4+NTR+oyG+5JxCDShkGNsf0Txb4Ou2GkgqhXdDreFwVv/Cx0vDX50I
         gcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023948; x=1793628748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=VxgPeifDQnU85SkOISi9gw3/cNPIdURgR1mXcfRJomZzcBr9ud+DUEBAjFhlSg+6t8
         9X3Ut/aqybuE/XXN7CYFDr+++T75HQJikoGSC9Ajb/o2/+dLRzxTOhgffpksTSpAURLX
         HJ+1uNSn4ZyRVQkvtfVTVjCjjT3JwVfQYH/qm1DsH3Qwg5ytCILc+kBoNqL7xtKv76ho
         Yizd64vqclJukqomAuNQgFmS3SrVqoH+pMfO0HID2keld5QVeMxHd1yRcE9Fx9snA1uh
         styBkRo0NyRLhXpDZUfJETq/MtF+jaoEx+qpqy8EgdhMecXA8OdOVqGW8lauKMDtp9q/
         RbEg==
X-Forwarded-Encrypted: i=1; AKwUvBwYlhmWMmbSyltYHZKx5rP8Ad7GBVXWPv3sA5buHvsx59LHSDXN2JSCtb5JiD0XfoNOFnU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKx+Sd8xCuDrbIjVuyUC3p0Aptomlpx3at5p0miLNZErlw7I6Cs
	FbpKvu0uaB4zypLwWv3i38kBMON8gavUvVg46o21kYdB8AJOnK1DDXP9GICgfE2aftsSD1AWoXX
	6OBpTR7TTpCdiR+toXDFVPqPkMCFwVJtXd2D1k2IYKcjwbmANkSCeMoY=
X-Gm-Gg: AYBFou3CXxEs0HAKnWIVyu/Mtf+6ttamfmEtG+0oxTdLPiEwRVunKugHwNTMhUcgkks
	eMJ9EY3SAJQWf47lB2v9/OHmvO2k8/+Dqwj1UjgBZwb1PgjxMQNlQYn2ovW65FENcHYLhg12+gg
	xGCeXcGwAb92Wyvy317MBamLQ1KRq9ySE9vS3mxUnC/vvV/VjhHtTIeoUNZDcxPYL5kkZDho3U2
	zQax0WUTZcn9dHHp03xzXEmH37wx6WMFUxhrqPrJxCwHtn/AlL8G7smFUyK4RCd1r2hnFvjhj1H
	Z5rBHpOgQqgFdXgJdiKshSaKc+mp3BWfa5mTxQur36gaNZyVTAR3Dpxesp1M4x+Gn+99T6ClYOG
	mwtWOMOL0zo3lPgbF3CsoWQ==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934417e0c.5.1793023947956;
        Mon, 26 Oct 2026 07:12:27 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934356e0c.5.1793023947243;
        Mon, 26 Oct 2026 07:12:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm324825266b.87.2026.10.26.07.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:25 -0700 (PDT)
Message-ID: <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:24 +0100
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
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX25tyzhjV6KMm
 vCxBoZengrQLZdwJCulF6kOtrhUiwEwuehJScGTc1BM9TCJN/xGkFfBtej+hh2JnNg29rXsO1l+
 lIp57Kgjtt92u5fp8enu9xe0rBZuEnk=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf5fcc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zrBrzXTul4GvSfT2LqoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: tOdD2e3HsfZkh_a-Tef1pW4HVR1mPiNo
X-Proofpoint-ORIG-GUID: tOdD2e3HsfZkh_a-Tef1pW4HVR1mPiNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX29MRJ4JrEyYp
 6Nwe+N9p4HGNkn29qHePNNADgLLivQB4we98Mp6LX9/X0qv4mVAoAGUP9EYkPBuGhu4Lgm2Fh5r
 wyS4cwxmZSIF1UkrpO1ezfhvRg6+ONUFLNc0ZCyqz8b6soFoP7UqRvUqiLf3Cz4AXOiXlm8d4ei
 cUNtVvjBWlQeHcX7bI07Hv5ZsSYKUNXIiEvLsfb0AOWWpumSwtf/FTUifvl8kv37LbFoV4D+5r5
 2rNS/2LSfeHs0D5PlvvJDyNm67uwwsrQM4PK8FdQodrOD92IlOf4dUTWGWbusGiT/ZJFNV0rjRo
 e1Rd2pOKpSNrPQYNSKsrSmafGuE5IuC64c1s0Bc/Bd4+17rFutbKPnjRfMOl2fFJCqeZFbRbcQg
 PDbWiw1nPr+XWoEdiApguoyMUeGLmC6XIxLGBeYMApKOpbIgiU7owmbZDM62ps6A7GOSosXyJFb
 onYwUo3YH+9MjVD6Irw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260056

On 10/19/26 7:01 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

> And another point we should note is, the MFD cell name
> "qpnp-temp-alarm" used right now does not bind to our temp-alarm
> driver and this was intentional, as explained by Johan Hovold
> in his change (mfd: pm8008: Rework to match new DT binding),
> in the last paragraph of the commit message:
> 
>     Finally, note that the temperature alarm and GPIO subdrivers need some
>     minor rework before they can be used with non-SPMI devices like the
>     PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
>     rather than "spmi" prefix to prevent binding until the driver has been
>     updated.
> 
> Since these changes are not yet done, we cannot use
> temp-alarm for PM8008 or PM8010 over I2C for now.

I read that as one more reason to shave off said diff

Konrad
