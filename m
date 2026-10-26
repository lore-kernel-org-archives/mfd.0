Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023972;
	b=uK4SGiruig/pF9nLcHqaY4LcKcT2oNK98I+uGJxKaQh9xy+EPfZkJzyP0p1kauSCzPHD
	 Sh53P/S7EGY0GaEzBKetNuxPvfg2ydBEy34hzttegkHO3giuy+3vQYJkRzg/2PiISZmPv
	 LEePCVYnnvbCQBtPlHwuGHoS2pEwsqRhrgUqBJ7GdUPTJDqjDnKVREbdjNx3akTBNjZNW
	 Sm+diZTtTA8iMuA5aWypWInLYq5yfanv34XI+OgOdWaN8x1LJaEQyD+6VNWHjt8yezL1j
	 rrrSukDx9jV5P7Tt+uYKJi0e8XGPKVuNiV/P+vJCgpoXcDe74u01SJZIjOKdkO7grFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
	b=O+XDAsapLd82n0X4QO9hEmUP5uNC9gZG55kMIVxoXDIRzOO38mJZwikQkA7RpRH8KUG9
	 eWrI+8uvaURKdZhNfFuF2e/Sqi1dnRgDg7yxccyJbDF7l88gEpH6GmnP0tpbqU1DtiE8a
	 g8obzzI1BcTXmp4/q/MfEFXfxdcDDJC5lWoPK5GoC7G9181jTO8DFHr2HututWf7ndJYD
	 ZT9/By1uEpkKYuxG0rmiizifgyakepx6sFEFVGwSekNW9uzdc1iLIpqI/4MnHiMKHcQTu
	 WBKkUcJwZ+X8yLqZ+RnJEH83iLrvelW2n2IiXuAVb/LqtbLlfNy6P/O95cv6u3DbsyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS64DBaA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460FC606A31D
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460FC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS64DBaA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsqe73033600
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 14:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=; b=UjaiqTmU7fiHzeyZ
	26KInDkK981IDmWIvg9QuSIwAoRV4uKC480pT7B9TvrbbGMNboQbblR6ZNGkcdd7
	vQt+JGNJSX3DvH11byU/7zUqgnMYTcMB2I8KV36wj0v7Tv6Sd0Ai+VnHteyEeAFT
	WQC53Qbg0aCOJMLFVkp/lDZSh6v22a2HYb6kThPbpe79t6tajROE3x5Mv77jwssM
	OqAcknKfA4zAC1u5nkHH4o4Qz14/wkOc/2TMoJgDUhtRzj2knlTRpztfgTGHiu2y
	fzdVvwp3fjIm9AZq0grmzITjTOfOxrCcLccuy5mgw379LWBrg3BS1GqU+s/OVD4V
	cIKY0w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0sqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 14:12:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaabe26601so156926e0c.2
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023970; x=1793628770; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=aS64DBaAcCNUcORY7iTuy/f+ewA34SasMbzc3PvLefI/aH3p1+Elmwhf1kkNcRYSqu
         20ax/wtNDujDzzUGYPx5OhY15JzLoHhq/Ru+wDyIWk5smoZtpTD2yJDTlajX/YeVIGon
         aXgBYOrHoFRdC37Vzy52Re43J2l2eg6nfOrino0/yqbOrrsNBrGz9JLd3hRzj/3ifIop
         iqqlvwrxeGJhO0++/fbR54DXzruW429Pw8WU86+8WeadLvvpIkx53QsC4vi8oI0x3ypt
         EfC3txWSdYCt41/6zMUl5f0Pe+XW83tWTBxxb5BqrTAw8zVmJ7sJ6TFW4SOAuxxBTRtn
         sakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023970; x=1793628770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=DY2l0OYIOpLPuQtpzAlVw09oyFdw+ttYcwH4DJuZshlsPPR5kdLsSLUxLBOIPaPN6z
         JoWsNxRJOlWTVpV5DfYJdN17zk++ku+naV4y+tuxwMEk0kJl2GP+GfBtyEvmZJOC0Hwb
         ID54RfbgeMKWZX6f0xkpxfXY1R0tXDFCM1gmR3v3mt1++At2ZPFdhUPLu/noxcWDaecH
         keDiY2XEr2VmxaBZ10KaMZjsU3SbfJ4s7aEDnAStv+yJ+h5mF7ZWYdOPxTfw6hBqXDDy
         iZ6x7STNdQcopi9zs3a5Tc9Her1j48aaENIH7eUI1rC1rBpaLhpoWG8C1ZPmrYpe3LfO
         GmhA==
X-Forwarded-Encrypted: i=1; AKwUvBywRgJeaLGON+r57BTmsVfmMZ25/UxrFGB29Je8ri0NF2l00ikCqH66OaCL1iB3QkuI2Z0=@lists.linux.dev
X-Gm-Message-State: AFq9FYI2+vEx3KD2uTBvEr0/uWxh1uDL0xiTaH5huQvIn6vCseZ1Tb3C
	aXGBHHAMS8pb2xBwlrM5a/FRWATed/4LaFpHaN3fuhaH2cQppMMq7ZyHHZzjMiHjnfsvnR0fx1f
	bTQQltKqtc0vzrmUdjd/tIuNRRoebAoWr0nT5wrBC1T1rSeciz0NyJlE=
X-Gm-Gg: AYBFou0lkS0pRxV8sC6oI6GiK5EYCJTjFt92fj60BHFNXWPft8/r9eZ7yDABY/zl2BE
	c8LxZ2CvwhsjHh1sF6hnYv9QQJaT+sFvAJfq0lBIJezddYSty7bdlfPaPTJlRYtTcejhjer6V4P
	wnjI8BinIzeRH7n3sjupkTjGpb983AGWtkEUUfmHfFD+OT+NpZKkfO9SCD1U9050kaYsw84etTP
	+7zH7Fm+Abykjxu5lRUJkcZa/BDciOtFhgDgtIbl/aaPKTSTJz0Aqecjfn+nY05mnLJVvlvnEVp
	bTIoFfs1Pmnrg1hZES2Dz6nezOoaGM0y+zapKd9h093mPivtBVCADdiFiH/6a7UXDIvbc3HXnoK
	M09oTxXdF7tcFt0DL4Hvjtg==
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648635e0c.5.1793023970249;
        Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648609e0c.5.1793023969822;
        Mon, 26 Oct 2026 07:12:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5202d9sm327107466b.32.2026.10.26.07.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:48 -0700 (PDT)
Message-ID: <e8a228e3-a414-4b2f-bfc8-e3225063bc49@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:46 +0100
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
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
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
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
 <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX3aJF9lB/k/Bu
 g5twSguZ7c0eU+ERu21473iPE6BES5u6TJE/kvAu0eUp3ppSI4Krl/d5GbIUtC5Qoa5ZB0FFvbk
 dyhJRMENpNuFWqQ8HW5HuWjpBjX4kVI=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf5fe2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=QnRxpVyo2ezrWcQ_LvsA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX5RMEk+HDhOzz
 do29d2jDEuOUWHMxdgHiaqC++mJKWFvvrpxfAUiXYdJnhDUEsyaUdaXBDqpyo3X947kKUam+Ehd
 Hw9akWNDPmvzst4ajgNkq/dve5t6QhbWr/VKim1vMDXnRpVB4pQbQ4ancqjSMSDr97m3MmI2EYa
 ZoSwM1GC1MPBTe6EOHZqaOx+HVBmuiwODw0zAe6rFqHBNbu7FFLqOEqkV1SIKRn8bJDonSknTZS
 mdCuAa23RP8EgiH2Kzq7Zk9s46QWnnnBUGtb8uOjftgLOQzFSW5jilbqqmnt4jN/F+mkOoLgVLT
 usG8VvigANDZ7T+cKVxLopFr0XYeJVaTcf8WEy24VWwHwKebAlwzGJjpu/RCVCSI0Lxp2mFGrEZ
 +IQSIL0RIeTQJ8FLo6qGhPTM1lys0GLw1cJsuXU/DOMvdy87R5JBu2Fnn2pGCz+vRbPyOEYY2qM
 rvx2Q2sSaxKysnZ8zPw==
X-Proofpoint-GUID: O5a5BDShuZkMTl_en3F9fTtd4k3rHfvQ
X-Proofpoint-ORIG-GUID: O5a5BDShuZkMTl_en3F9fTtd4k3rHfvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/19/26 7:00 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:34 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> PM8010 is effectively the next generation of PM8008. The device is
>>> generally designed to serve the exact same function - power camera
>>> sensors and the associated supporting hardware.
>>
>> [...]
>>
>>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
>>
>> I don't understand why you changed my match_data_struct approach
>> here just to reconstruct the same data
>>
> 
> I was asked to do this by Lee here: https://lore.kernel.org/all/20260922093327.GA2308615@google.com/
> and also by sashiko: https://lore.kernel.org/all/20260918165137.302631F000FF@smtp.kernel.org/.
> 
> Using an enum ID with switch() statement, instead of more complex
> match_data structs, seems to be a convention to follow in MFD drivers.
> For example, I could see the same being done in probes of
> drivers/mfd/rohm-bd71828.c and drivers/mfd/max77620.c.

Okay, if the maintainer said so, let's roll with it

Konrad
