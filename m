Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6370D3E44E4
	for <mfd@lists.linux.dev>; Mon, 13 Jul 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938559; cv=pass; b=rL2Z4hjoKM8ukhSoc9sJmSG/WiajgEQ+pjDF8VVbkkze5fKMexQmX8xmGTNvHUIP/E6qlPyOhJ0HOj8moQAfWzOkeS3cyjyAGewZjSRIdh5f3Kloyj/g/MleFzv55tAtAjjRMbbR588MP4KGQPiQEjinw4qDAhS4KZmOhetp+wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938559; c=relaxed/simple;
	bh=g9PH7rit3zO//u5Hq2QTKSHhPM7nodoH6Z5rCiQghkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRbjfBUJ0nFnBhkDDIruLTCi/X4fpBHTZPkz3P1YCQU8jmGK8hCan0Iq3MJfCBoGCnKGV6bRscIBoxqmvpRxgoxukVLWZksQXpNFHX+SclDBxGziPCaVl3XK8YsZZI8LlQDBhgodpLxmiHkMB9M3FG7PjL8z+NuXt/oppWItSMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNFOxgh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=goSfUZ54; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNFOxgh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="goSfUZ54"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ucNf1089698
	for <mfd@lists.linux.dev>; Mon, 13 Jul 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=; b=QNFOxgh31F+aQwWH
	ovN+MuWYrQupUnEJ4E05qCBe2S9rP7KHAIzWX8QuWwVLkBnQCTy1Hz9uUXC1S7DF
	8ziWPWrYXfAPxVQX7yIQ90tkfXiCc0VPr519QCrHicbq5mx/va6EOAY8OJvHnMC3
	RZF+ARzvL1gWrkTRgAmMOSEPMRMgnJsk3tSucarsmgrls/L4q+xlgyoSuIM/bgkt
	B+B96eVD2U0ghoOzlEzmHlymMGN9Zy4snq+v8VItrjMOWQ4hjzJIFO+xwOz3UgBn
	1yZtKxrH/rfPDe0dXOHL2JQMVO51Kqi381IJox02JTjVELMpumm0HRsXH/c9hr2z
	cyqT8w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r3qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 13 Jul 2026 10:29:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f08560ea44so46289056d6.1
        for <mfd@lists.linux.dev>; Mon, 13 Jul 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783938556; cv=none;
        d=google.com; s=arc-20260327;
        b=sWOzfbfslvMS8lK89OtCSJljBn1SckVFpn08CWm9bkTGHRgbEpZTZmmL7BAJr8lYQ6
         o6kk60ABAV9zqpWsrdip4Fzns8pD6mBPnoskoIYLeNbfE0U9H2JMWz83UmEo+RoOLUI8
         VpEPe3mVG+avliRlTtLM6k/MYOV9r0j+gUYDzd0uF9iOkwSpp9ao531GGIgM0z8wISAq
         +X41nNX4HbedP9z7xrn9i5B8vDkZmivlgFmDeVDxgNL88cw+TWUj+ZL/P15xQNsW2mE0
         86JnSbEKoXhhX+wKUHsTfHcGjw8jgoyFFQmQRblVcZH64MLU5+vCDmaQR0RL/mAwT+FV
         Z1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        fh=dxQe6cBiS6khj4AMoryjVkbt9bUC+ZCdVXUZhwmYvM0=;
        b=BkQ2deyKxOeSQTWVxnZtuWat2ZIMsUBot3Cj4IIY8lmKRnoDkzdhlmv2euxUPU/Lib
         3dItqglH7mwx4iCNkchgcADRlTIg3aOcw3/bO+d1ibIOVZ5jF2OQIbPCtgYXciP/H3br
         K8ue3qro/px9wUoPi/hmCa7M5ZC/QNi4nRPDIwM8ZveFjm0et4zsIIqi8BohIDpYaSf9
         WFrNNmpPoUdE4qKXxJ/QahlbmvCHaZ14yrcMuK21ZfY+suDPif80emUb/yl6LM/33u7R
         2aTeFXBONgNWrhOXw90NLdKIsmYAI9MP+Q1bVL4D4S+RJh7ousAbbNjbMsJcIbgHGzio
         2YAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938556; x=1784543356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=goSfUZ543oEtgZDsjYw1l0t0GrV2PUtlV0/ZJO72tgkXp9fyKSK49q+uB+IvxvFT5P
         yomVNsWnvJtmetbm1dmAgbGrH9WcmpAfdTfG1bEVB+Fjz/t4pYmHxuZRT3XubZSI0qdr
         VhWOzpvM4YaCcJdA7w7Pg60PK799616dmQC8n4lmMaHLP66ywYisXhs9eHzMMSCapsUV
         wE3Van87VnwQiP9lBCTsnR11ga1bvYcuQyAQn4ug2sQfPvmbQ8hn07+EWchFPSnqfp+z
         FL0DDDsFQ7c9N25uikNXab5DBu4jU4TPiTInDFWFJ/juPWUf7pgoY0IA1E37OWXmWJHR
         J98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938556; x=1784543356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=oTCAqdklb6X/19sl4rW4B06iQNTd3retrJYZo7vFTvPzI6t67ObnfwUuflrWm5RjoA
         oERNV4+nB8Ph6D+ETj91wR0VIwGy356nSsfaLF5jso+h3oXEYG2EkpnXuDy7+bulX6HU
         EisktdQ6VysQPVMmshKastc1xU/87Vf2RHmsjUEjnUYvhYhloEJFmVYu3XLQ5rM4r5j5
         92TMQk0tZXyleX0REEOT+SN/RiCGW5+Rskyab856R2bBqsekHZ/5MnAQM5dJGEmbl5wb
         7M7EWg47s8D5aJmo0k/91Gdmi2PDd8RG0QCv6jZfUyj/TNlFttKkXvsI96/uKM1wsuwc
         bmng==
X-Forwarded-Encrypted: i=1; AHgh+RpGhggYyA7jiakRt3tQq8TZG2qGAgIrThc8SMWR8n37OVtKoA78BdAIMrBR6RAOex7qZV4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwIu2oQf1xA+6nuE6Zep/AmYHnAytIAJCZAiASsmS7qfVxWkTG
	i/9aMjwGOH08OCxTGk4beCwVB5IwsXuw7DSolYnaupk3mtpl4RZigTopohUgvUdzI5mW6hxKN6u
	TxbqoA+zMLB/eCFMuINFzvthmvBLx5BbudntKc96HcvUIAsD+ljZyh8M2mrFRi4RN8dKWypjECc
	B2vN+MnnEjVGM3JFhiDlqaRSmMHUrqGg==
X-Gm-Gg: AfdE7ckW++ppA1VnyAHPeQAui9FgFJrIEhGYMLi33arXIcNTKAieJPE6IgJCiViVgQ4
	DVzpvoMNKwSmArX+e5wjSKbO0s8HrE7uJ+kOxR59ENKcDKHI4+m7p+c60Eb8fnp9CNYYPVzSxsq
	nSvK1d6dMg01duUy9M4Jgrxba248dQWP9D8cTif/ZUk+zLPbznSlze3C9kdu2LqwKNkOS7
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id 6a1803df08f44-903ff76144dmr97564876d6.1.1783938555917;
        Mon, 13 Jul 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id
 6a1803df08f44-903ff76144dmr97564106d6.1.1783938555502; Mon, 13 Jul 2026
 03:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com> <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:29:04 +0200
X-Gm-Features: AUfX_myf4-1EuuJEsM9iEruoBmhvEE1_shBmpnLHYi6rPSO8vgxEgiRb5eZm2os
Message-ID: <CAPx+jO-P3Yt6T5Kb97MjmMB1mYeEgjStCkSACM_wsrqsBVFEvA@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] pmdomain: imx: use platform_device_set_of_node()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54bdfc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=-ghbRyKqcrg4NgclPfMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX17gswzosa6vN
 7QMKLqoniWvij0VZ18Qet9mDQgaI7IHut3s1sIwBVRa61pbHfaGeTc7Z9gAqzVF7mb0OjPYBtQh
 j28Q6I2fCkRYolK1WhEKoR3S3bh/ibI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXzwDVi+Ofb/Cq
 R9qjG7IUnN8U07QlT3ryMrFwrHDLgb2DOTorXcbQanIm3j6xM3vFt4KRKUt+AmDegyVfubepWW3
 UmMw1C8lIYqGsgKNfCXd8/+KkNX80DfaDGlvRILYNKn9x1ciHs30nlKgGNNa8vzO5orCUSAhmMs
 YJETpB9VZuz1vb6bki2wiQJcEYkI/MIwv4VkgnwBGiJM851dvkAgCzz925J5HOBeFYlMXdEnYnb
 yyuhdhzdtAzo5B15hnmjCxWxFmrXYGrDZUmBX/n45ZJvjd12bT0hNynjMmITjkDvLsuQQwxnAuW
 JLcD5caRfMKwHoSpszb1fXuJSowQKMnjd8DWND0nQmO1OICLHkN/u9kULwh4jJXm7YWmghmp+db
 bARVCZhWRbJies8CsNnzyE1y0m+taqKHA/gqi5/B4SVxDqufnzEeap3TUXLuT6Q9MnZRhlyZJgk
 7fw1G3QlEVgID98Lx2Q==
X-Proofpoint-ORIG-GUID: vPo5KxqnpLYVZlx7oyS5V_h_Olk8FFVD
X-Proofpoint-GUID: vPo5KxqnpLYVZlx7oyS5V_h_Olk8FFVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

On Mon, Jul 6, 2026 at 2:45=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

If not too late, feel free to add:

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e=
1395c413160c950 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D of_node_get(np);
> -                       pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> +                       platform_device_set_of_node(pd_pdev, np);
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
