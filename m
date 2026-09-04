Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F233C872B
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506262; cv=pass; b=c3lEi2kKBFsJ8sUsJKMGXvqP1cQmYn/h/G4KIs9B7ohdQrPaPCbG+oXTlObK4pDj+1W3nvFSKCHD1zqWzj/vLegnyN1WTK15oNkto66exfs+++CtCgwBbZ4zY6vlmKpkXCvndZ8zyGMbpDXL1R/JUYtThzxoN8j09XYuSM7byAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506262; c=relaxed/simple;
	bh=J8dsPnAWdboF1yFvJDLhBeE5gRfGXjP3682VM1Iqx2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoMTY1dWYVH+2gWRmfkPljKw0PmtekNcXn6Jh1JkeLknk5WS1cdWRsbgWtdvk5BGfR8i1fSjKCko9C0ITCcbUKx7Zy/cb4ijtohLY5U8E9eNyMMuvmxl3iVErbUohRmhbGnMMa3oPIcyk6jJXdln2aREd0z+1s4JwfiU0smLNDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI8FT8Wh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTi3vxxp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI8FT8Wh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTi3vxxp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68463Ucr3009002
	for <mfd@lists.linux.dev>; Fri, 4 Sep 2026 07:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=; b=OI8FT8WhAfwVk+ZZ
	8T5wxyqpe708tolnXc/VTkesfR67qqX1vGQ9RxJyEyTCl2T5XFfW8RIeogaCL5Zt
	4E/omkikXWrxxm+RLQRXjGY0OlJQ2lKWJX0g7LtAZgVjohNaB92hYZsfdUHcte/P
	SBndiqT6076Ry6JMFdRQyA+2Yf7A2Xx9N0ugFAnnXxcUTJ91+wZlVx8as/ZggFZl
	TmagoMORfsZZj+pAc6bU0p25PSM7HrrM0tq/Hyx/iBXiNcsc5oY0K9+La/nYnu39
	XHaTGr8kOkiuMF9F3RftxWTB2ENwvtQAqCyEA0/kgNGd5Ouwb+M10AzzU4CyC56j
	k3HbZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r0nur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 07:17:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1113045a12.2
        for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 00:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788506259; cv=none;
        d=google.com; s=arc-20260327;
        b=IzgChsZZu18fqD7DEm2FPJgLPhYIXBSB7sXi0hruilCDyzTvltY5/QXjKnWgnm54XF
         BGh/yWmbLnwN3Wcv3DM3k47qI/oEM4BRjEEA7lmV3WPui0nsKXZVXBz6Tp2DC1vNpvNe
         F8zvBx8ldZmvjFrqKX/rtw/Do4Xra97RHAXLrLlDhKt3G0Sr+b43qKH1F9JNql2YDgna
         dGg+UcOVzlhZIw9QXlQ4VLK3gQJytH5wvUQYUmJejr92tRUd6KttDzKYbfU+HXVDe7PX
         dxg7xq9tc2OUc0dFvGkBVMal6YSEs5MxoNbSMSrXL5uJrQu5hRfEhgYsgq349DIImzz7
         i17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        fh=4zRiIbAZG5MZmyzjqd5tDaKUw0rdcH7zh6ozR5lrIyI=;
        b=bg6Rtv/1DezJhcXYGK/inn2mxTFTzky4xoXgypGbwi6W5cjBkbxQh+2N1GmTuvGQm6
         U1/2HxehloEMgp1KNJ1XbLifJZhqY0Viouss6gt9AsoZLsoobYSiPZLUma5m+5CtpOrh
         82Y+kEMyxyT+Ex695TBBK6IAO9mh+Lw4HiiesNcSd1qNlRiMi7kxPvMW4SdjhH3C60PQ
         AFNPhCZtA/huJpWUj7v0JRzTRjsqzWHMCR4CY50YZ9VGDuEUqbpsmczVI1Pqy7tJDUAD
         3xhsFX+gRUIGR0b8RSDfSBKNLXOZIyhUDAS0+AJDMHFrfkwNhSUjlmnsuISa0o1JWL6r
         rMcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788506259; x=1789111059; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=hTi3vxxp+h0XdO2u1zvPn8sXfaLFxlRgEnCYdw0/Xc3Gy2Ca7W9yx3a0Vob4NlIywe
         J2KfPyUVYfWFDM9G06hKeDWFffPgghCpAh6/A58zjizPo4R/BpC3nHhFLfYN4XdRZc0W
         gCaH7/ZlzcEvZQYcLJ31Gmld8tj0uQUhOYPP8cBmreAW3cTG0094o8CoBVzBuUr/JDxY
         D2y8LUH5fTkxeIEsXnhO5wvdMkLAodgf64qzSJ8C1Xrg2clDPyqEd20HjdtxAjlVXm8U
         Wd0MMzv38lquD00UvlPKphhPITzViBkPXenMSiLO/lyz3bFv+wJF5LL+Ar16m+guuS1w
         FpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788506259; x=1789111059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=eziGO9HB+C/JMix9Imk3Je3OBUPzpCvdW+mGxGM068YH/rIJ5wSF+a3WUk4eo5DZLZ
         c7tNS384lMOv+s5vJoESOwTEGs4JXgCMMSheCyVc70YevefAdpDTQzb+M7f3dwj4UPvA
         CO+klvB5XhBGxA2td/bb9ZIM3HmK+edUFysIduTqEh00N51+9/QBeo7XPFuWfbk8PYEA
         PVBYwAplWB3Hq1F7zewE/5suUK+VwmKiSmntnI2wXc82oJo/GbuhpAbIphLt1PxeLGto
         irFUtscTtulS0c+Wn7eH0yWz4xq0lLE0ORZlXcbedTwQdFnCIrfz/lckv2/htFTRx4R7
         pHjg==
X-Forwarded-Encrypted: i=1; AKwUvBw1ApS7PAw2Z3qnpiByNNNAC+cJwTE6mwIAzaH0Ox8/XVyHqNwGOB5yUB6EEDkZhIN9kxA=@lists.linux.dev
X-Gm-Message-State: AFuF++ldup+Tsqyf0aRCcPhthazA/jAs7GZ4W970SRoeT3O1m9C/HNwG
	iSJ8ewhiZ4g/0r4oY1rqlAqa4H6Tv2/NtdFy3QNLpw0Ys30vZQHM6Y02FjgZ7r4lC8bEPv6vdQg
	9e62L0aTNW+yE7wQhWgb6IkOQ6kamQT7hi0CKZxhcD1xljps/pOiNTDo/H1lvFbquwdpS+CNJBB
	f+PY2p9+LMBgAnoGzIFU20+r3+g8dR6w==
X-Gm-Gg: AYBFou2MjWZTCwjeYzSm/JrEha6VVUh/GCu1iPFQXjIjJBuK23vu5ZPm+Xsjgsr/1ZK
	rKITjg3lNo3oI1+AWX+m/AQPeFknFjH2cnfu+LUP4eAf3EKGBMrZCT4QX4yPkk6AdM7bUlcvnpB
	zqcYLHApRKIN42fpFPdUGcTHsDvU8xvl9I6gHLhaLtjhVixG20ytCIY0AOZA==
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr5927955637.0.1788506258755;
        Fri, 04 Sep 2026 00:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id
 adf61e73a8af0-3da39878551mr5927876637.0.1788506258295; Fri, 04 Sep 2026
 00:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
In-Reply-To: <20260903160401.GV2133376@google.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:17:25 +0200
X-Gm-Features: AcwNN1XLgC_UnHcC1VgAAx4Zjez2ZZ2qUdiBHVeX_BYEXGU9Ghy4hb4yt4Luazs
Message-ID: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI resets
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfX4W88R7dxnjYY
 WnLrjQZxnVjxhArjiTBcBpWIUTraxV82Tlqud7mMT1QgKWbjKBefDNphzZKmA2Z4DOP5FatJ+zT
 QmDZs91Z7159+x2tQ0Z6xA2sEVHOKRA=
X-Proofpoint-ORIG-GUID: DhyNFqqSuJ24VWrsg0RtnoyG5E4GIaem
X-Proofpoint-GUID: DhyNFqqSuJ24VWrsg0RtnoyG5E4GIaem
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a7093 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=RfyTg-q-OfOJAL476ygA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfXzip65kF7ns3r
 dUpjJm46lDKzKy0zV14ZKGMVadR4r1dHM3eYR9BdGh8x/JykQHRJtuyCEQygAo0GbQNgxVJFWTX
 uD/nY/faIme7KNxUOTvatRv0xNGBh28goQOqjFUpAd8LInXLpRbfo0r1Q7pWPQWce6n9Lsnwr9m
 nLFhtZelOf2sjg4eFA5WqJzdWkluhVpSzdbQ9I5Xp+qMO7LEb6p72FjE/zgEI58nQ5LTX22K/zQ
 h4vsOe2vHY8iYGCNU2WCuKQsjCNGuIby35APNylh+jubF7QmNK2EsNjepSVl3PQYK9i/ooh42Sf
 nvAFwzkVOoXNekeldQ7bvVj+2VgttEY3F0nPiGVZ9awdKdyaAeNT7Oyx99oto9SgQj4rK5JlwmV
 IwkkQ/ICeCoaWNd3NSjFXgsCAdlB6xoRY+Sw4ZSwQaAaCQgZYw5bw55ajbtntJxA5KL4TRCMGKT
 +GYdboXQXT6NReLCdEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040066

On Thu, Sep 3, 2026 at 6:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
> > Userspace should be able to initiate device reboots using the various
> > PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> > patch series introduces psci-reboot-mode driver that will induce
> > command-based resets to psci driver for executing the device reset.
>
> The more I read through this submission, the more convinced I get that
> it does not belong in MFD.  This is a potentially nice "architectural
> workaround" if it a) didn't break some of MFD's fundamental "real
> devices only" rules, of which cpuidle and reboot-mode certainly are not
> and b) didn't require a massive expansion of what the MFD core is
> designed to do.  I am more that a little uncomfortable with the 150
> lines being added to MFD core support this workaround.
>
> My best suggestion so far would be to base these changes inside
> drivers/firmware/psci and use the aux bus to communicate with the
> various components.

We had some off list discussions about this as well and it seems like
we are in agreement. What you are suggesting makes perfect sense to
me.

Kind regards
Uffe
