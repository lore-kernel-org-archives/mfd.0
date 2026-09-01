Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782B305666
	for <mfd@lists.linux.dev>; Tue,  1 Sep 2026 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258657; cv=pass; b=nOE2qzW+ZxO/6f15ZWS3AOXj1EJMC080vmBh2BDY6Ta7wk97Y/8piXnK4jR8mjZ38aYFjugpOrPUOX9sv3Jz1GnvG3JxGbNSyFqrnGc4b0T4eLSxeoW7fpHaituFfdY3LZVCw+04gdHRT8Y/tvmOe0dxZMmgcu8ayxN1WHZw6vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258657; c=relaxed/simple;
	bh=lWFns13aUQVRLJ9/uaF4B2fLPnX4BZA6Ycqj2XWx6wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmTWv/ffk/reeVaWZSdqIq2s9Gl20UnOCrr/9YfmrEEc3aC2geBpQXY71oRf1snQGEaJ7IIW5l6V+HbrsomEpg1qlDWb+b2DUrRb3Psb07m8vstjjx/B9p0g9qOVpmSus/AGEsj7egsFjkLGwUm16eVKiZAzyR32r+BseUv9iMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L24pVZ/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzgsEZe4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L24pVZ/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzgsEZe4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJZoG2323301
	for <mfd@lists.linux.dev>; Tue, 1 Sep 2026 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=; b=L24pVZ/ZqR3UqxGK
	/67Ss2CEWxRkdLC3ayiyFTGUoXWpcWN4OwFx0jrQtRXWn1FW9W5QfwLgb8KTD0k9
	VXA3inANCmxJRdNG1TdFzjqDC2lkfvvladRHjVG4IrE+z65E9aAnsEQTGw71IFRt
	Cth5Kl1JLNSIKsmyJW5tOWNTFgYA2eaAG7rmiTDyTpYah40uhNhRnI9nNlIapDXx
	tgGkDMaYbMwGfILTDIdpdgjsacyyIgftl8+InQ7uxVvbYahckUBUSTutJog97nUF
	ICuTYp4BAjDzqlVCXHjSMsyWarzJJVoGX2cpKxi1M91rxA81h4lNdrgCFXIrEQUf
	kNHixg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c9vkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 01 Sep 2026 10:30:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so8781188a91.1
        for <mfd@lists.linux.dev>; Tue, 01 Sep 2026 03:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258654; cv=none;
        d=google.com; s=arc-20260327;
        b=irQZZzdpUVuRoUHvGkn9eA3jftAPFEFRkv39l/nFBn3QSssadO2RXc6F70uIXLE8GT
         BVy74jR8V6wZ1eD+wduW5LQTaWxukOTtcapCZwSkcqNmrehbROUv5PAA7M1iskmSCs5B
         +Ot5uS+u0y0393VVIT4HyDiA8uskmgT3+6Suzybo4wNH2m1oIj3oUywJxGFce96Ur764
         vvU9PC4jrqn7OAWsXxV8QKyDhH1CtU/5W2UrYs8ZaiEEjwpSQ5wFR3zUQ1VBOZryrlj/
         aKqxMPNYoYkBFIol7+P6gC9zEBj0uHoqeN/UW2MRpsoiXWMMcgsS1aF/2Gcj8d5Cltpv
         GivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        fh=pLrEA/vFVz42YsMlDYryzShGmbz7i6+fers3ZirLUSE=;
        b=lFIZP5TC4/zrklpTveO8BIPKVH8p5rpeKr3v2xskVqaZ+61Wr27NIwpaim843/ssG0
         8+BsWiMp7zxHwe95zidw5XjXph95l74hU72q3YVlJZjrO8IOA0TaJpB5jowy/el9Csk5
         2ZqVH6EtOdNIz3wROpRBwlejnNMlRLL9kurBk0kb72Pqzesz0jj0zWFNXSn/yOMZAF7N
         N/2kYL5m1mxAnnFOPYFCAJynUI8QswbbiSsUyF2CU0e9m5SjAMlCzu+Q6p7swP64T1K3
         ftx4TWFkLK6ofu4TX+s+pOhHFChatqRJUNg17rWT0r09zs35HvxlqNp5Er+iQDOUVcXS
         THOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258654; x=1788863454; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=QzgsEZe4MlqpdKY1vyyTTo1gP0dSM8p4qYUSneHnoDEmQKukv/HvoGLoAT5Nj84qAV
         /LVyD1ZVK9owld17+DpYaI7ty95LqInOfSdxcWn/fedmVul+PMWvT3dYDD5QQ613p+8B
         g0rP5kGRU60M7IHim37qIzA2U7+Cq1iGp77OMt+RqWLlBxJIM9CFKyvv9MP/apoZdcGe
         kck75I7u+Q2kBsg9mb5il7xp4CPQqF8lBpvEbhTw7DO8MDF+4gbKnqt4JK7H9UISBg9v
         Z6v25yIngOMKJjH0WcO6wcfS4XnmbDvYTE7D8NjxFzyQBJJJ8viRAiph0IfV1qOJYJWz
         D4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258654; x=1788863454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=PGRP/Q9+Rs9MK8LjM6rCoPQUT26kEOoM32DBhPIBYtomdjZ3e9WhDvpO3k5/GG4/2t
         +OqgK0CtK0F9mzz910oAgzK+JHr2aWIv+DVYCYlDc8Beug9UJnw58zXYTqY8+BKLbdr1
         jVouATyfqI56SHjzVtucjasFumU3UstFM6J4rgwydJ44FnWdI4drzbqZve9piIXMecAf
         SfCNrSoznXeRJWO4BbsYOrkPonq6SRVxY9N/YrIK4dlQXWAfULpJFI/aBb/jzawBRTs1
         LARA3JFiRf8kZ6iZJYEBuxDzKsz0TXEEfKL8378mN+A7YTZ54ZnsM0qNiH+hH+weTNNl
         6Lzw==
X-Forwarded-Encrypted: i=1; AKwUvBza5bKEojp4yXCIySRnWRnkQlfvL385ODOj79jGSh9nq8cBVmht+Ui9eJA5y3C5TlJ4eLw=@lists.linux.dev
X-Gm-Message-State: AFuF++lQPNgTeAFp5td8b/RdtuNMGxBIzorMgCPEDo9XJMT9SIU04taP
	8IScmBubRAiAJe6cnue4/HBenjp6yRd8p+V63XtJB04S1xQhec9tsSPOzPNaKvqrH9adoK46wJP
	s5likhXAuCQOo12IIVS3rFLIZ5CoO5i1aIbfurbRdRqDYY62Tdj0eDS/KcCmg+QD5vS2pu/a9w9
	t9TH2MPezD8Whb286i4qQ1cO1nDeRNlw==
X-Gm-Gg: AYBFou0pZnviPwtqeB+5Py9KDkbvZpWKaZoesIhJNozVDYrztKJ2uqBfgaBN+Nf98dI
	7LI0zcd1RCLEMnFmDRc6H0HBFWeYLDlOQNGSuepgWUk3MnLkkNU3CADhhlnNrMzajVoc/v/bOFB
	CxMhqaGKAQ3cAKlNy0s5tG3EsfnpQAXDCMkuP6ECzGsVXMZidmj+CsgIXbyA==
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr48338165a91.9.1788258654315;
        Tue, 01 Sep 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-396d0ed8eb2mr48338075a91.9.1788258653663; Tue, 01 Sep 2026
 03:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
 <CAMRc=Mezpj4A7o00C9hhs97kdA5Q+FZKTLRbDM+fR8qr0xCCqw@mail.gmail.com>
 <20260827125906.GJ770273@google.com> <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
In-Reply-To: <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:30:42 +0200
X-Gm-Features: AcwNN1UeB9u2F8V9KZ-ekpacU9KYz87Vz22k3R4eoK1r51ZtRDyRbVXuvUd2fmo
Message-ID: <CAPx+jO8XTr-C6gPRWA2t4TVCTdRQ8oquhrfv7vMmC1oV_DpcZA@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96a95e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vprddorpQwRN7yjes_cA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 6tESLQ1BgRCNTCCUpQX8ZBpgy02VLdXc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX9c2tUUE32r+r
 Sve9tCifv4swsDDw3A4NSLpNCedwQAAWFsdstMD+270bgZaObP5eqbtQhP5KAsUAxpFnzuLaq4I
 eOJ0rhdtGxgsecxiq7HsdVCA0BsK3mI=
X-Proofpoint-GUID: 6tESLQ1BgRCNTCCUpQX8ZBpgy02VLdXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX0Ufl0u92Ppcr
 cYNKD0vm+4BNG74fVODdeZzeKcBk4Eqj7GFUY+u3imvKvzQ7sfnM8IuylqGiFeKIR7pISYfYTDM
 aOj8QQsXyELPVG4zDcMQdrEpg+w5c/neHA+vM8dJYZvijLLLMLNPu3ouTJhMbVPScta/M0tM4Jq
 rXPyRh5DNw8l6D7LPHgID4J35r4msAWWO4awBzC1jomw09la20RiNXDOsAazrP6M2m/mtQY5meI
 0Xjn2QW8ynrvLZ9FvBuTKOLac1e1P+wreqJgKL0tLXZgPAqDwRGg2Kl4QxbmSpLvBekYVjDO+02
 4DXQqmKbYaP+bDS1c2tJx+s1niXRNCVtXn5jt/Z6qu4hiTLaSpXPqU2IA7fWHauN9Se+W/d1Lqm
 34C2rutgTz5F/Jyp+FcyLDWGds/wY98kl71OQtHprkoDnVTEbEymD5Nseju5xdv9YCNKRvVgP2u
 7Uh+twu9kEuRgCJV4xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010091

On Tue, Sep 1, 2026 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 27 Aug 2026 14:59:06 +0200, Lee Jones <lee@kernel.org> said:
> > On Wed, 26 Aug 2026, Bartosz Golaszewski wrote:
> >
> >> On Fri, 21 Aug 2026 14:59:49 +0200, Ulf Hansson
> >> <ulf.hansson@oss.qualcomm.com> said:
> >> > On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
> >> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >> >>
> >> >> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> >> >> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> >> >> directly to the same PSCI node "arm,psci-1.0". Additional consumers=
, if
> >> >> introduced, would also need to bind in the same way, leading to sev=
eral
> >> >> drivers attached to a single device node.
> >> >>
> >> >> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and regist=
ers
> >> >> PSCI child cells. As the first user, register cpuidle-psci-domain a=
s a
> >> >> child cell.
> >> >
> >> > I don't think PSCI should be modeled as an MFD device with childrens=
.
> >> >
> >> > Instead, this looks rather like a better fit for the auxiliary
> >> > bus/driver. Please consider using that instead.
> >> >
> >>
> >> Hi Uffe!
> >>
> >> Since I was the one to suggest MFD - would you mind providing more arg=
uments
> >> in favor of your preferred option?
> >>
> >> My reasoning for MFD was that it is indeed a device that provides mult=
iple
> >> functionalities, of which cpuidle is not really he main one even thoug=
h it's
> >> currently the only driver binding to this node.
> >>
> >> In any case, we'd need a "core" driver binding to the psci node and wi=
th
> >> multiple auxiliary devices with their own drivers, we'd end up reimple=
menting
> >> MFD.
> >
> > Ulf could be correct.
> >
> > MFD is usually reserved for real devices, whereas the aux is a little
> > more loose.  Please consider it as an option.
> >
>
> My point is: if you start registering auxiliary devices from a "core" pla=
tform
> driver based on real child OF nodes then you're basically re-implementing=
 MFD.
>
> At that point you're better off just using the existing MFD infrastructur=
e.

I think it's as Lee said. MFD is for real devices, while auxiliary is
more suited to split up functionality using multiple drivers.

Kind regards
Uffe
