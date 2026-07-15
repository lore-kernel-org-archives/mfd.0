Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC0A44DB69
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118772; cv=none; b=dd5USu+q/xF0LhjiTbyJ9qcGCo4p8fw/KK2E1hHlsoywMlxYv4R1hFP6/cqkDDhG91H9Lvgoh7Ahs5zFUcA5v+zoEdYulmfuj2CbNSdQnoTKenm8ivtF+2S4AuCJdEZoX8qeyA6x4sF9gB3BsSMlql/9Aos2t3WTiBwJHfjRoC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118772; c=relaxed/simple;
	bh=l2EDokfVWLOd7EizmjOsTHzq73UGspoJZp1Op+A4qz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8Ys8uWv3K4ROGycU6iNvBJocpIpnb/u1KRdG6WvB+T7h7ABK7u/Goup1LjC3kLLeDrrp+cwbvr5ErnjV/AboBXq0VhPJrA2HElNIqKBgzfPxuFDZoRWoPLANG/9dy/DJyXh2p/XfJYQ21Wlhf1WlzjtYHYlK7dWv20MF88Hzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxosF29m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQQ5QtSu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxosF29m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQQ5QtSu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdTCU3697867
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 12:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=; b=GxosF29mlEn1Qxs3
	5o/4d5QBd1KCSGGHzVVtwh+vIQNsBNc0b9irJQ2GNEk6pYiPVwFc1UaDSZdYhOpV
	e4TFe39YMufArtUKFDY++oYcrDu9383doJTOp6RoZRlpdihq9SmOXmG98NJj+XDJ
	sd2kmO2vVublGF4RHrQdUmUJ9qCEwh1PSilkxKhcwH2lo7CPlIhcDb5boumrpJiw
	Iv2UgT++xSoxpOW38J3FjPcwJ2Yy1frdV4Pn2JnRX9HPF50uxlHr/JtnNo9jcrA6
	XCAHpgCRHLsXT2YTwdNxdn+9vN3RXU40hUmiCzwBwFVf6c0/ehP2HkgA12/Boogn
	KH5PFw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vj9x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 12:32:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4663141a91.3
        for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118767; x=1784723567; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=;
        b=AQQ5QtSu5MbScOMR/PgHVn3vWvYUyeflxHMyfO2RXNs2blwYfHIS0WH857fjyLFIGU
         RjH5GdAX08zbmws/PVLzIncrMVvmJSRF3/Yxys68NiEzWqXJXO6fUxH/C6qIPrZvuYVc
         LShmMopfZFQ0ah0TLSuNGbm01VFniOIfxvJlZ6eCTkbp/JmcxlNRk2RF2i6MYDc61ava
         +DDnC9IjXMmVAAdOzM5tU5ePHpeiGqtqEnPQFOEdc5NtevJ+RrFfVD+hmCDX0a91WP9v
         q64DYAxO34Bdaw45Xi6cRSTexIDmk4qQHvSuTWmH/PlXcx4jfwWKpdQhrQ+bTKY4BmF7
         Cyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118767; x=1784723567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=;
        b=Ig3aNC5j+8LJKcPbgSvKTAnYGLWxBEC+Cxj6izBcTa4zcBbGba9zZuKzkiRcoLZZ0l
         lkRPhpQdtVkAWn4Ls+dzT04KWHOwPnJK9oGVVHxywHF2Q9CZcM6n7AbJ3Pxx0YZydxG+
         6pKbKgmWTpIBaOfs0dY3mTOpyrXQCwu2JIw0a1T9rWsg/zhQhjnBjYOb/1ax32MMSSno
         7EjpKGbo7WbU49ja3lRc0Qh5p7Ab3syor56s2NzWSS4W+X/AEgSpl4buPJQ8UasR8irL
         hnt+nUHzr975UmKvkSLwsEpIAeONQ9fMSZwt7kPNPjDVYtGzYXBpu7wC1kHDxgkMJ/e5
         0/7w==
X-Forwarded-Encrypted: i=1; AHgh+RoQwEdo9JCusFpSIKL7xOY7k/9sO2V8jRtFdPCpq+YiybK5bW5c3xyC5Ry6aIRvEZpkfLw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnvoq9SdP0HKb5G22/qIC7xbAcmsStmGittEnieXo9pMS6PeO5
	rX2Vq4ktwYxhrU6pVPtV8by1JBRii8Aya2pByTa06B76C1utJtgRamK+BuvL3JNXrXMcoAG4DBc
	ko8cdbspWrsYNxRGAYfwEtjVxqkW4UGMtgsQjFB34dY+9Qst3Dvcqvko=
X-Gm-Gg: AfdE7cnSKaNM2vhBmtD/XQHrvn9c2E888cy+qV7xPdEVAAlv2Q/teJf6RE267ndaqaH
	8bw7zbEHFl20eVpu5RXn6g7q2bwB2IncjpkBj/s5JAzN9G9yBAwMxRkHQcuL4b05BirqwUOAeoy
	q+P1uXSApromuK+neslZIocIISSOzq+exWYwkgaDX8NEMvwPnSjAeZXY1YN1WbEBhXC9kKcfYU2
	n9X7snGtZmLYyI1RUROGgnM4MsK44Jg58uxGsZY9RGfkk5z9V4YhCU+WVugm/2dOqPY1s6SJodP
	moDOzZd0URltr3vIXPi0mNgeNi9TvTx87QppK+wCg4SgbBwkFb5u4SmdIH+11bjMZ9aUT6w0MU+
	oevXBXXFy50DJSCR8DM7q+NNFreWaPRxD9wtd1YN4c2PZag==
X-Received: by 2002:a17:90b:3c81:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-38dc776da74mr16463991a91.33.1784118767643;
        Wed, 15 Jul 2026 05:32:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3c81:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-38dc776da74mr16463948a91.33.1784118767258;
        Wed, 15 Jul 2026 05:32:47 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm1515390eec.9.2026.07.15.05.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:32:46 -0700 (PDT)
Message-ID: <5aad793e-2dff-4727-985d-5615a204f309@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:02:35 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a577df0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1ebYhdgdrGDEZLiK4_QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qXv5ILjiuUhSMR1EZPL36UEXonOLdsr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfXzFmHIZ51EmcT
 4RtfbV1s6QIl1abKjlUBIZUvCjin/rJX5KPvD2P3vaVaif1M39FN1Y+iV3/D8YyD/6Tn5SXx2d+
 Nwr5oDo+a9eU/OimZoFd7jbwTE2K7NQAq4RQU7MQZiJrHBs3V0mWGR9GL9d3vV24mMNkwWeuyzA
 GwEocOcj0mdBXVtKb02lg8sJBfkFADb7wFbXIoha9NOFJGRqd1darNbMqImuE807uL9uV0DejCL
 F5vv3vHbgLFVavpIiVstBv3Qz6uMsiQVN4xmxlEsinV+JUkPo3uITtqwWa09l6CoN+4cL9wiDdx
 /wAQvHQsqIG1najFGyBcUnboUNPCzuzWUU9ottmzRPxRWhoCryn5SxrlBckjKYBYo4wBIVaNRGG
 I9mjPSbKtcc/kwRPEOUQNZle7bA1WDeQ4dxDPif//R7TdrMBcP7MTOqxdW0QaoVHfqWuDQNxiW7
 wLP1Dz6mgnw4Ei3v9TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfX4qsVgIQEowe/
 CbxgQEZG0hmgS5FsxldHmLKFg0MqBWb6oC1TwlMc3xmtCDnpcEEqPPYSIZ/6JBMHfT+TfS7n6SY
 1k3UHdruCFWBuxJi7HCzLIF9VGZWsjs=
X-Proofpoint-GUID: qXv5ILjiuUhSMR1EZPL36UEXonOLdsr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150125



On 15-07-2026 17:56, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:30 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
>> cookie as arguments. This cannot be implemented via the reboot-mode
>> framework, which supports a single 32-bit argument as magic value.
>>
>> Extend the reboot-mode framework to support up to three 32-bit arguments
>> as magic, per reboot-mode.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>>   drivers/power/reset/qcom-pon.c           |  8 ++++---
>>   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>>   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>>   include/linux/reboot-mode.h              |  4 +++-
> 
> Could we avoid having to modify multiple files here by just providing a new
> function:
> 
>      nvmem_reboot_mode_write_full()
> 
> with the prototype you proposed and making the existing
> nvmem_reboot_mode_write() a thin wrapper around it?

sure. will update it.

thanks,
Shivendra
