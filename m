Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C662C1595
	for <mfd@lists.linux.dev>; Fri, 24 Jul 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905631; cv=pass; b=SzgSExhWPVpHIMYh1KCQMknnreNT/pM734ktgaOtXvSFOIqIx8pl0xg/MBc/njvRevsl4RpWpCHoLd0VePxZwRb0vsNNr3wTfaxaB/V6/kEGAlmE/kOPEYw9AnOSLz8khHchx9Rup/0DXpcdR14RbK3O0UnwdhhMTfNdkQV4NKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905631; c=relaxed/simple;
	bh=TqF3wLHIA1jAdZt0Tltgjjcw3xRF7uJIwJwkCK9UGR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgmegDkLJ2XKuIffQu3Rr2G9gbwTy2sl0mJPDHgKu+jaymLl3weu24iEkWebxcmj06VS8AjR59iP8jcbh09St5a5KNzWDVsPvV3/UGLRDoCCzdusGsfDft2sxSwoTp4vJD/r1jczMLyyM8Jd6hZVpjysHHJ0F3uE/cdPzMHYXds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMNYH8YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMFf3aBJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMNYH8YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMFf3aBJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb8Cb3344396
	for <mfd@lists.linux.dev>; Fri, 24 Jul 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=; b=CMNYH8YKsP0vLnKa
	kg5kejSOcOGDDykg6w4NaAMhIZjMwg5Hvpg2qVVAeGFA6SXIkFXHAI/V9jYZZTSy
	RttEgtp4bwm6aE9p1KGLNE0/MB+O/oivlVfzYqqXeDZ/TYz39Fv1fPEUWjQMmKmB
	ZOhZL4fM89UgzYGiONz5xZQQ8LEp9cpVqsU7E9WNOiG8/iFseatouKgfxZnlVqh6
	rWFhOjCyVDJkJyyzui4Pk9uGykx+T9GFLHJOTV+t4bciz5za3v7JZndxoHiqDk4w
	c6pEZ4xZYfHEQPLIJ2zTQeesRUAuDTSkH8JP6vyj4qfAeEMOO27lPxff5lNMPRVs
	QuKvrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0hv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 24 Jul 2026 15:07:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so83060085a.2
        for <mfd@lists.linux.dev>; Fri, 24 Jul 2026 08:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905624; cv=none;
        d=google.com; s=arc-20260327;
        b=CLeM7bZdtUq98mfpoPyRoRc2RYLj6ZNGCU/5lq2MY1KMpr7rSthaU41iPDku/wC2/4
         lRFA/Nfbz/3BMLZ41lCN5tVtKSa3II2UZ4xc+UUFY8dG+c6ubA2IAZ1xdKhA8P92MlXx
         8JWeKWhnmSEvvwkxKJc4eCJzt49+M3N1iRPvX0/8MYU67czZkhAu8LFX0e6KuLJXIcmo
         692IfFFJlNLY+NAquOeFRPpLLS4nQiALRPbpmnw2R08Dy3nzTWmyF1Z0+nRhAiy+jRX3
         BLAiGes4bKlxn+ltbvjZpb/KkVKKC18NTwSaDjPohFcUQ979wXLFwoCDeWTmamqm1w2B
         fvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        fh=3qk61W8BT+/rnqdM8QK6I6MGgCKN1IflaPowV420ydM=;
        b=UNLtXPX33NURdMXxUoOaL4+FJbDVdoSGEHE3Mlq0q62PUg0vYEuzpC2AzqzWO57yXv
         Rshaox4G6a53JptlV9IcBpzvXA2aMrZlozoOWo7/QwzRcw8Mt6J8Ibp3DkyJO5dZoja/
         rX7PKWNVF3CA/hFSLR8vA7mAqJn7y8RJBm3zM69G/kV7mi+zy9PQPVSpm6PxnjeSm2h1
         xIqNfBXVjQUlviSUBLrG5dcJqHW1UCNK8xdyUTyEl8eKg5CmZvL3Ij3WFsBXCL3L6/DW
         TfFaIwSTVizSQu/ARt2b6xXTh7xaJHb9rxF4Y50jfIeGpa+T6i2/iCqEnc/wfj0efVdG
         mrIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905624; x=1785510424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=DMFf3aBJXWZmEyyf3ZJpCzufZt2FEkCHIKwbIGE7H5jDnCfdk09N4s2P+DprWR5tqj
         Oc1pSb5MRbgVUGaSGgoxE2x3CFhqlc42CTypFDiC9IPeNrvYLKcorUyLXcvWgwZP9bzr
         ekZ8kGkkLzyZJrmblrvh/8id6VmFn33C0QKPZFGy67+u4hg1sx/RrphBW2TOO3M8q7cz
         CE42U8Y5y7RetRWXSiW3WMgqaq8QJ4Rw8yp2hElK0kqOS4IzHbR40v/fO3bWe3Wshzk5
         K31V49tVxjjKRg9l1x+6IzToM/QSLXFUeuC360eA9VAI4dyoZUCAIxni3SBO/f8EU9Qt
         3Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905624; x=1785510424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=lU4Z8dSN7/3OB5ng5GLrqH00EqEnn4LZxWrxJtxqcOjSHgDyNcYM5q/iKl+Yxeljs+
         F8PPy8EcEeOI8oz/oZ5CyN6/xfh0bSenHazDoudqzBzMeC+i6vjC3Ny/uleIkGAQy2Rv
         eZV+JztZR+uPsTtQTdSFrl2HsGd65q06jMxzZg67YC8o5URU1e3I1ZnfpXx2MshELkeT
         mQunh/ol2G3D/N5dkpkyJ5YxhI/UDUR+AAkZoMvWX7ZIbUJlk2DMzCQWqE/0iB0lFcdF
         Xfw71XI+df2svdUkbBhHFzJleJZvEhNHMPvz1H9eqsTdqUhHjkjhjYT3cX3WGe3Haz+G
         ihuA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/QfY5PX9A+sbeWY13K2JNBgNKrB0OMwLYp14sTUbvtOPbRu1y10N/Af/O+2lZpQa2ke4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGJnpnCMTj9eqsg4N0Hmja3XwKuSPW7whjbzeJdtlQY2PijpJZ
	hrIabStI1OFVhUvHFNzUhcRhXR8S1Qp70QnZDWaEUTc9yvqipQAtJX5mEnnPG2dYJfYRjfKfkSu
	3ztNt/ebsux4/xDrq7bXF5YCLd5aSpxJS/Knq1ADg+6qkqoeyxxut/uL1FDggbRZmbEgs8/EC7z
	/Rc1Nq9LOrrLWiQx+umgjz3tSYqbejZw==
X-Gm-Gg: AR+sD11r5kNDULpPDwP7HV62zaRRXKXov05s8fQ5OTIf24B3NebdSwMEMKpMzfhDKlI
	pqkUGeIY2vhuAkP5x5WauA6uwKskpZuEmX68Iqms9Zx/jAIBVoIr6uwQI9pINNHwyxuzFCVanII
	5D6425wdogdGsbJRFyR97fWMN/6u7Mcp2AuqLafsL9wS57YJ2cDNqSpeZBfA==
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id af79cd13be357-93103a65117mr772236185a.92.1784905623971;
        Fri, 24 Jul 2026 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id
 af79cd13be357-93103a65117mr772229085a.92.1784905623517; Fri, 24 Jul 2026
 08:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:51 +0200
X-Gm-Features: AUfX_mxUpEE-_djVPIMU7ZvWbbzhCFmItK3_9wrfK5-RcRFUSwGHiGhMmnFjL0c
Message-ID: <CAPx+jO9=HWwr4jGoCcWAM6fKTTrg3TphgPiNX+4yvfnyEZa_pg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, netdev@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX9CbMCr0ggq+z
 oCRi7tas1LL6Yet4xo6HhRKKgG79gWR/NGe4LvJcegQ9gJFjQR5peh6gJHJrcqYg5LaGvzFzKFe
 vo0ufZOGUsYQybk00IY9Kyc5OuqbapU=
X-Proofpoint-GUID: omd0rdirE_uvHjzm_S5qiZPWM_KpG38d
X-Proofpoint-ORIG-GUID: omd0rdirE_uvHjzm_S5qiZPWM_KpG38d
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a637f99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX2842rtaaKFLU
 n6g/9LdweF/Z/OvCyKMKVhcAOlfxwJsSqNSWxOPRDaGlhEPc5yxanEhDR7mzpJQochXXfeZ3IcS
 JT1b5ZnjB/T8Sm7MuPnLxc0cgKnl0+1MdxwKka3Qi5orj9YpyfR4Y6g/p0ySXDupVqq699YEpMJ
 I7qtpaBMCmmlsbhah5RgjDIWmGeCUBvBvn5LAOPWfC0mi3MpxlWfBraDCmHYhiLo/jEa+MF1bVV
 Xpo5dczEf0fEW5UY/ALFogc5OK/+u3c0RgKFxiFoAnY+3iWK3f/4Ov3GrtHMOjMq+m29vhTsmz7
 +YSBPoWbZSC0BLXrTXftjg8PRvNIjx5LHzPTMn6MLKieoIGVgqmyflkOKatKK2y4ojT4zg8Xu8H
 jx6y6TubniZWA5TNRmsK6/xGx/7f/BYkLc3gwaXrrUMWp7VNBIhWm7BwfW1Mku4BpyMxyftKBF1
 4wjaxZJtWjB5joScHxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240136

On Mon, Jul 20, 2026 at 11:25=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec870=
29420981581e48e 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       platform_device_set_of_node(pd_pdev, np);
> +                       platform_device_set_fwnode(pd_pdev, of_fwnode_han=
dle(np));
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
