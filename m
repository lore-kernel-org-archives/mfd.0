Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16924A3F2A
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530391; cv=none; b=ExCTf573sS6jvKuLQT/C3TH7szst3CpSFeybgqI9NY7c2+TypJS3OHjT5X9cNhorhBWESIqML3WGcF0z5WdIVJnVs4FnB9NBUE4e7DEjkkaOO44FPOcRCkyNrz5o4xE/FL1f30PjfpAOB/1ujc6NBOCkkHaUszptUORhqEWnhpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530391; c=relaxed/simple;
	bh=rOqwJWlnCyLtEeUosqm01QDB1wq0VG+lLC+a/zLyXaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaNjXXaP1JrR8TllVrmsmbudpXZZ5cwTL30P7KwzcAbEsaV4BIbzuUbhPe1Wx6kMQRL0nZ/oLUEzg4CthK8A77QnQhmjRo8Y+TDOJ9F9YSFJ4i9l1e3hj+KJJGG1PL6Xzp5PeHkTrxpxOp+Kb85bJ/ENN4j/HcSQaHAdPQge+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fY4xsw7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W890laYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fY4xsw7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W890laYe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Dh59H3890979
	for <mfd@lists.linux.dev>; Fri, 4 Sep 2026 13:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=; b=fY4xsw7HwR9/FMO3
	jOCQfqol95XN0fLUfd+N7N9h9PW9lOFV19GbCzojuA+I13RdKhzgtKmrd7n8dszf
	prafltu/5WW2i4NjouPgcSrgFodABKV5nC952ErfIgC43A9skmCRrCs5FOWzuWKz
	/HnqL4OULbe00I1oaZuoG9BpYT+Y1wQVIQBgKsE2AZDdPJ1usaoCjyFxPSWtwzmn
	KwjyRAJcfQsNFRuwcbQyCK0RuFnOsLqMyw3eg9yw9D3soWAOporGKiIyX8pCTcwq
	jjGbBEkZdiDzedjEcCrUG2ZeLiYaH31aRza3C6znRn8fK3ajtjc3A1OZUVX+R8XD
	nyKfwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp7827j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 13:59:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso2488368a91.0
        for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788530388; x=1789135188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=W890laYe0f3p9iilKyU3r0GvyGYF8qsSU22yFNxnHQ7nn/VTgDbcHbpHVzj8t2K/17
         6XPFxhPRAC7cSYDerrTwCAklIoU10oqY1fgdDxVeZIGsAWO0E/vfWRylBgIP9lUERYPz
         RpRbdQVClqUtaEiYpYueG5MyYfNLV5MuRJ4SpadfasFrZh/vyRyMw2qE57+BKMuvmty4
         q3LkfORnbxGNy7CVljy2KnzQOY4jGF4NNMTfWdkHPI+pOT/yryFsIINkXXMu2rRhACAW
         AFMJ21s1edgDi0pBZCNhs2ny5S2W7Rp/JLRvMaBr67++0yTd5AuPMJZI1BKxp10YQS9p
         Z41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530388; x=1789135188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=BF/0CGts0Nquajo9zcEAuThlfaLdTnGXhC9Ok+00Ae56qw9FfC7yOcWx8qpXuWLwf1
         m6073JIgMkkkfBUH3EsW2TTdzsZLitbuxtS7pLwV51NFneJwcjmGuMDGnio71Xrwqo2U
         mmaO582T6oZ9C9GcVzgPTpzTrPfQPy+9+9s4bSAcLuG5UDfSye83L4OqlBqKypVDmMc9
         ulNucFUTCkh75yrIBt1CGiOdo36WdCKnHaiUk7oK5A/gIx7Q+4QJOFkKTr2Q9SGkvccn
         q6Scf+YWKRrJ7f0VVCEmRJgMXECrjH3CqlV05JzWFlFaLdmcsI8YagMwRHYJmwHz60jQ
         QTdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8/RjHbxA5ZBsr9alOTD9UpAJID0pQehgj9DtIa0e7ZG1skMWUvhel5DoAbAQ83rXPMaE=@lists.linux.dev
X-Gm-Message-State: AFuF++kE0LFxRj+ylBPvTTza28XmmaclG/Le8g33MbKSL0qNapajNRPF
	ZWOedqNtmL4QDbInrW3oCyWSldJtoUEfQNHFp4CLPa8M1wzRWBCJZIs3YrLplc1ALtUwst3hzS5
	44tGMwioL801S2qylyDkEfnk76FVUHkV/JAX0ouLnCeCrUPsXBYwRe/c=
X-Gm-Gg: AYBFou3VGL+YG88nYzfViiyyADpB1ba5C9WZ+mpKSfjp02KSgW0aIdNDE7lKLCrYK6K
	m8rRVH3qYVbNPk0Chw2C1Qaf9mz0DVyZ7Zpz5YrhKMGBDganb/ZelMWIOGNwHg7FIrB7woELYiC
	QEBCP6pfF1UUPaKTJY6UIsDNiEjCdi8vqgbqHKnlNeLcFMreWPyR4CRtb125mE1fqUPZP5yeXfC
	lVy+er0SfFHgASPRX9KjwxSh4cVDLI09l9MPD6bPiS0wdXAhsKVnM1a7cIVegk2+7gK1zqHwUBK
	CGI0mtwCI+uP6WbuPrbtA+LALHo4VI27W64ogHPhWZ4CbovSLKDMmu1mp0+j9uvjFNW10U0/GsQ
	wQPC4Tm29djkK2X0/0TKSzpyV+7CQnd3iW0U=
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673327a91.6.1788530387579;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673267a91.6.1788530387149;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm10478642eec.16.2026.09.04.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:59:46 -0700 (PDT)
Message-ID: <8968c292-0613-4420-82f9-2e3fbf30d81e@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 19:29:33 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI
 resets
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
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
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
 <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfXwrKGw5g3jgf6
 uf9FJS0r5/sxMfaLP/agmZ5K6/w0WxfE8cfuUjRZEwGkqH8GzsQsaxKYaXa+6x1lGUqm75/m6a1
 +Wx6boUiEJse+eCLoeLu+2P2F6KYtM4=
X-Proofpoint-GUID: WJrQYmC8FyPY4snslfnNmzCuv08gTr6E
X-Proofpoint-ORIG-GUID: WJrQYmC8FyPY4snslfnNmzCuv08gTr6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfX3dNq+cnuo+MW
 bvXepR1l89FHKqbe2IjppkprrdG9nvS5tt8XBAjldtiNVHKTNGz1syhSS6aJ0tsSGcqY+U9gGc7
 tzIdv1hgfR2qKiahGCwULXsG8KJB39r+Y6lKOm3+WMiklHDrqMmfhn5HlJOkidzVCW8MIstveMR
 p/XzWEIL314zaflXsAEO4CqebixbHgD7IWZY1AOxYvJYOFet8g4iaTnJK4vyz6vtlBVdsUdrr9g
 nETqyFdMOXfwNulrQr/O96rqkfsitqzetMMlAIszR/QrIqxjcNJy5b14Vs/RtmEB+gx6sDmJCuj
 m00wpUYd4C2PBoYvK3wUGttgHgbqtABh6jazZJL52qBC+JZ7xshSXD5huIMb7qCUzdiWxioJsPx
 Vx4NkwX6qpWH8SDfWPEQtl+9QUjiFg==
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9aced4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=KLk5RGObiDQBJbYytlEIzQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KpQgwA5mMx-DUpL1sGUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040127



On 9/4/2026 12:47 PM, Ulf Hansson wrote:
> On Thu, Sep 3, 2026 at 6:04 PM Lee Jones <lee@kernel.org> wrote:
>>
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> Userspace should be able to initiate device reboots using the various
>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>> patch series introduces psci-reboot-mode driver that will induce
>>> command-based resets to psci driver for executing the device reset.
>>
>> The more I read through this submission, the more convinced I get that
>> it does not belong in MFD.  This is a potentially nice "architectural
>> workaround" if it a) didn't break some of MFD's fundamental "real
>> devices only" rules, of which cpuidle and reboot-mode certainly are not
>> and b) didn't require a massive expansion of what the MFD core is
>> designed to do.  I am more that a little uncomfortable with the 150
>> lines being added to MFD core support this workaround.
>>
>> My best suggestion so far would be to base these changes inside
>> drivers/firmware/psci and use the aux bus to communicate with the
>> various components.
> 
> We had some off list discussions about this as well and it seems like
> we are in agreement. What you are suggesting makes perfect sense to
> me.

Thanks for reviews. I will move this to Aux and re-post.

thanks,
Shivendra
