Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAD3BBA01
	for <mfd@lists.linux.dev>; Tue,  6 Oct 2026 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276803; cv=pass; b=Sa+nlQFO9IjR/IoxQYvNXBHgksH+WPYk+XumcN2F5JYpQi7t1fwlD5X9CJKQE4/Ve6b0Z3IUihhDCMNl0VsE5Pbh/rB+29l9L8b1qNTPyETtAGYXJBu7/PzG36XOiQfb0e/WZurLd8HP7RVpwPDhpCDjv+SApZ1/9g32coRwFbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276803; c=relaxed/simple;
	bh=VLcjVIGQA/r1W3ldFK6WW8apuDX6mf7txYWwobfyjFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJ1jxQtgmHKy2PiTj6AJsiV6QKzAX7r7i3xVL8CFqaNRvKwMobH6Sk0msHe2f5uCTwbCpx8cKSSVyVMWtM0KfYnyoPq4Z69pGiAJIkijY+v/Y1fJZ05ajOyT/pveiKePVeJ4PykTiP9Wod5rQQZGRTAgOO5P3XVMkMUQvL/OqEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N11QSB1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVRwD8ch; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N11QSB1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVRwD8ch"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eHts3903253
	for <mfd@lists.linux.dev>; Tue, 6 Oct 2026 08:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQGtjGd8ssqWuv/V61Y20ONf
	ksGn+OprzCvB7AXUQWs=; b=N11QSB1zHyJJcjTIZFpax126Tk7PweRduHBLIQfr
	9WI/6tPVU6/1Sq7jSIhD7iJncx2dewrhweyDOeUxV7rS7YUMXPT4CrkLbzD5QgzM
	2q+RyDEN71+5KHHvSjS5clpUzoAVcBcq//y305l50RsWDd6KAR//l+rjuKWZCW2+
	wipkInHf7SGEizuN4h6jeybHNmEW2SJIBirz46aStIzpgr6hKBd8oLIihZDzjNR7
	sb8BuFtQnbettKsV3vvYdZC4V6ZTrDJylyo07DXmfIVN3D37HZ2g3ECCIl7F5JQn
	rUollOwbyfQoRHPqdxD6SfvQavDSjhPpLiyRB6m2GiM92g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dvfsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 06 Oct 2026 08:53:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so39916485ad.1
        for <mfd@lists.linux.dev>; Tue, 06 Oct 2026 01:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791276800; cv=none;
        d=google.com; s=arc-20260327;
        b=rv41IOhEpdr+63W4cXQJi70n93WSzXiY1e+2hfsRIFV8m8SaPMqONnNQlrnSngrtSi
         vK1Jz7NGhLkTu3gKcFNf4St78corqRkjMbbakrklFZ5UIEjUN3ikrL5Cb3TSu8LI/A4D
         twPP+rsnDvTsu1xf/7Yiet2WPArLd225qK5ry0GwMcJXIViRTl17tSUI/v8Eo9cf9mSZ
         2/q6FKNRdvBzxRczf4Ty1VtXwReFh7oNUoHOVGkpaSDaMBy3PUnmFxhphBykuTmJSyKO
         NCpUh5AteudQqyQR0GmedapT46DHph6TEfmSaJqyU73n1eAWwKlQ2/yhXuEJb902phnV
         09+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QQGtjGd8ssqWuv/V61Y20ONfksGn+OprzCvB7AXUQWs=;
        fh=B3Z/rvGF0oXrdNyoBSnPj0YKEE3PgyieHtAhTBBvccY=;
        b=qx224GV8gY1jWwD7KN4Ubr/S4rHudWoG8lMmoedjb1CDb4Me/xMpYxZb7SH8uI4MN4
         XsmhDuVQ8LIUiz27A28oSXpjnxGCRjiraTlNMPwkYdrh0lkS7IqnPmov2TC00D6h0wjC
         ie3NKajPS9ksAt4idHDvjlOeKDvJ37CL2KCVz8DVYoWhj91OVMTa/9f12HOxF5CqRGaw
         VFC7c5BFiE0DQc/g6zy2PwFvD8TJosoX48qu7CRcka8Nt2h4zEsvLK29g4rE2+Xq+8Fy
         K5ierRzrKBhQQVwdG3pvFRzkXBcvrxjtHDUXFzV9tCQAYZCdLaw+Djjk41Ma5eXZB3ea
         THWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791276800; x=1791881600; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQGtjGd8ssqWuv/V61Y20ONfksGn+OprzCvB7AXUQWs=;
        b=FVRwD8chEjSG7lHD5i1vjrhVM79NyBDtCYUB6KQNyJBRF8Fyvs8u2t5AWeEPo5Tfrv
         Vkwbp9HVIvoBDGmWXDkGZYBliQCtklWCgFmCSaXy0UAMu9Li4WiKCPVQLCXDw4Ov6JJ8
         XWOB+EsKqqMRIKPtHmMc7KZ8Itg+JQbu9UmEkMMAe6r7Gz50betntvUapRslpk6ltg8v
         CBi4o9cdA4WUcBjwH/7dMH/g2dpoBtIkBZqZvmtNc8Qelx3z4pYvOIFWmHTbCT6IICTI
         fITmrnebTr07z+c+1iUNv42MpGcFrv7aNz+ZYhpyTQkF22HntCExWgIXkUllmQzohumo
         mWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791276800; x=1791881600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQGtjGd8ssqWuv/V61Y20ONfksGn+OprzCvB7AXUQWs=;
        b=o40IEE0a13pA8FFEdrveOazvSwTi/9ywBAWZVoP89TiwQhW6AiwXi0BUHqM43FAN3l
         tJGfmjWuKwgtrY/BkRjiUibzG7bW/KGNWRAkK/lXEq7Cyaf1CRUxZoDvAa5G1PIX7JS5
         VoPxXNex7HrN5J1j2pi1awzLSsiK2+wMkZZst4m6YBWULq8CKdER9IdUTvQUMya0mr4q
         odimeDZ4YDLNMzFDuWmamNJIcKTYDiRqK2lhZ9/FKew54HsjXcsLcFsM3iEuCRZKMIvr
         fSEvTx6G4OJeeMRhJ5gVPokhIAaDJuIZqxuVkHVWW+TZIJ2XI1j2Zd73CADuvZDrI2c1
         WnpQ==
X-Forwarded-Encrypted: i=1; AKwUvBySruOJRfHSC552f6RezuuPccGCyDaKy97YW94Xt7MU5qrxnyIjvBP7iP77Ow96T3pAYZk=@lists.linux.dev
X-Gm-Message-State: AFq9FYL/h2KV8i0KO+Fn6AdZ80wdD1mzM/6LQZAPZA2Wb+kx6+BgBDWl
	VPZcgkK3ptzJM+v8aZJxQ/1pj/1eWBlqhMNMC3320aRJ3X/FLUpZEflHlUQK8VR5/9CdrULIqD0
	cp+Kq1rdFrX5SwJaSD2pC9bXMdvLR54Me2aSEqm05SRG+OA7YSzOXUBu0v/p2UfkYm4E50MHn3X
	WBgnLDMYdA/y8Z57ifV5AjG+iFFK98nA==
X-Gm-Gg: AYBFou36hCuvFywq7zSnBBiagX3PmjYB3aq8tfs0kdU/C3D0LtE06BO2lk/Y6F9Ffz1
	0KIh40PcfFYhcOZJlIcGZz2o3vduDIOr/J/OV9A7+nzdYCuBUpJTEUFcuPgFQNGmA/KxVNEJTOS
	+IGkYsdrOlk7DMkVfyuRBbqmVqJDeOZlLvtI+iKC1muiRGiTeWTRhxiI/Oqvu/aLltg7lb9zHvk
	M+3ZkNmx2w/Gsc=
X-Received: by 2002:a17:903:388f:b0:2e4:949b:1ea1 with SMTP id d9443c01a7336-2e5dcde4da4mr6597195ad.55.1791276799654;
        Tue, 06 Oct 2026 01:53:19 -0700 (PDT)
X-Received: by 2002:a17:903:388f:b0:2e4:949b:1ea1 with SMTP id
 d9443c01a7336-2e5dcde4da4mr6596685ad.55.1791276799127; Tue, 06 Oct 2026
 01:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <179098834078.3641559.798772743228949994.b4-ty@b4> <e590764c-1ef7-4166-9c2d-a96a89029736@mainlining.org>
In-Reply-To: <e590764c-1ef7-4166-9c2d-a96a89029736@mainlining.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 10:53:07 +0200
X-Gm-Features: AclHuK-hxeLXCCkrwwvQbFIYUVeIjRX4eEFvyGsggP4ez254hGL6BWI-C4KAx08
Message-ID: <CAO9ioeVAf2GgS+wu9GiQ3kM-_1KnrdMfhcpVotxhiFegEiZP2A@mail.gmail.com>
Subject: Re: [PATCH v3 00/19] Add Initial Support For MSM8952, Add General
 Mobile Shamrock
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNSBTYWx0ZWRfXw76rqyc17qe5
 euwhHZCVm3O3YxBLIyjb49aiy+kwcIu4wY/YbO3pn7NZeu6NYPaqBU3dHol2rkt+2ivKg2IodYa
 CDeWZOc1Mo6/eh3e/RrKcQpsMELWpLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNSBTYWx0ZWRfX7fI+Su8wm30n
 9dzjtZi5jpS64/fc9usGazoH47kI+WhLhTERdC245bOyhQLKiIdgunXlknSsO976BFfoa0mHMjL
 zVslDJ19AWQjZGJn9Lqtd2g8NafGTw941evRFK2YOp4oKYfmys1tyrDgZSgy9VhZgXqRKsa5t5G
 gVOZB0f87EVLNPQEsN1PRZHMhJkKOcqfnA9aU9WFkD8JMkUIbJC3q8rEC2oIEdfS56n9wlaoc1X
 +p/bfSBN4faAWGH67ez9LwdEG3WO3yLsBItwhQBdmT2vZuOMqHWI1Hr7hbEMNhvGeIIDLvTHv6p
 t0GHzoFNvdsPvAe/foxXF7gX9xdElVpecYWooa8wUIjLHRqD6FnS39ABSwipI4sP0uR8Z3kGo11
 TbWGfKBbno7A29GPhz5oSUXYBq5k7ryQUxstkkTOCfK31Xgxx8Sd9BLCMbPyMPq+F5fPPoWjsGj
 mKWm/ec0MOddhgxSIWg==
X-Proofpoint-GUID: 1xuKJvz-QvOzJCyaOQRghIUKcqnx5sv5
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac4b700 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=OuZLqq7tAAAA:8
 a=wG-LvS21qxlCLh7KYX8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 1xuKJvz-QvOzJCyaOQRghIUKcqnx5sv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060035

On Mon, 5 Oct 2026 at 16:00, Muzaffer Kadir
<muzafferkadir@mainlining.org> wrote:
>
> On Sat,  3 Oct 2026 03:46:52 +0300, Dmitry Baryshkov wrote:
> > On Mon, 21 Sep 2026 21:18:51 +0300, Muzaffer Kadir wrote:
> >> MSM8952 is a SoC with 8 core cpu and Adreno 405 gpu.
> >>
> >> Ported without uart connection. ramoops and usb
> >> mainly used to debug.
> >> USB is not enabled in this series because it
> >> depends on the not yet upstreamed (and not developed by me)
> >> pmi8950_smbcharger.
> >>
> >> [...]
> >
> > Applied to ttt, thanks!
> >
> > [01/19] dt-bindings: clock: qcom: Add MSM8952 global clock controller
> >         (no commit info)
> > [02/19] clk: qcom: Add global clock controller driver for MSM8952
> >         (no commit info)
> > [03/19] dt-bindings: nvmem: Add compatible for MSM8952
> >         (no commit info)
> > [04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
> >         (no commit info)
> > [05/19] dt-bindings: mmc: sdhci-msm: Add MSM8952 compatible
> >         (no commit info)
> > [06/19] dt-bindings: vendor-prefixes: Add General Mobile
> >         (no commit info)
> > [07/19] dt-bindings: arm: qcom: Document MSM8952 SoC binding
> >         (no commit info)
> > [08/19] dt-bindings: iommu: qcom,iommu: Add MSM8952 IOMMU to SMMUv2 compatibles
> >         (no commit info)
> > [09/19] dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8952
> >         (no commit info)
> > [10/19] dt-bindings: display/msm: qcom, mdp5: Add MSM8952 compatible
> >         https://gitlab.freedesktop.org/lumag/msm/-/commit/df6ce9e6447e
> > [11/19] dt-bindings: firmware: qcom,scm: Document MSM8952 SCM
> >         (no commit info)
> > [12/19] dt-bindings: clock: qcom,rpmcc: Add MSM8952 compatible
> >         (no commit info)
> > [13/19] drm: msm: mdp5: Add MDP5 configuration for MSM8952
> >         https://gitlab.freedesktop.org/lumag/msm/-/commit/7af226f9aa59
> > [14/19] soc: qcom: ubwc: Add UBWC config for MSM8952
> >         (no commit info)
> > [15/19] dt-bindings: thermal: tsens: Add MSM8952
> >         (no commit info)
> > [16/19] thermal: qcom: tsens: Add support for MSM8952 tsens
> >         (no commit info)
> > [17/19] arm64: dts: qcom: Add initial support for MSM8952
> >         (no commit info)
> > [18/19] dt-bindings: input: touchscreen: goodix: Add binding for GT970
> >         (no commit info)
> > [19/19] arm64: dts: qcom: generalmobile-shamrock: new device
> >         (no commit info)
>
> Hi Dmitry,
>
> Thanks for accepting MDP5 patches.
>
> The message lists all 19 patches, but only 10 and 13 have commit
> links, the rest say "(no commit info)". Does this mean the whole
> series was applied, or only the MDP5 ones?

Only MDP5 ones.

>
> Best regards,
> Muzaffer Kadir
>


-- 
With best wishes
Dmitry
