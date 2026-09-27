Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C8E3EE1EA
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514357; cv=none; b=up+QccwRRa62pDrIBZpQJsUNX3jYBuzEwVl4iIdpdLaqLkon9/diV+f2bWGHW+Hy5z3ywqxxdXIswVqLibud1IRbyfeUqXo2I1cpkAdfTonHFkxgIAwR7+DIoDOYG7yRkIoMFdFoSP7AGegDGzZskirpDY+YwIaYVtQQgkKE75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514357; c=relaxed/simple;
	bh=5PhNDLHcT1Iw8t7jW4E73wXBcMvAkzi2XT999lFdLh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwF7M5t3SouEFNACf0r3yRq3pmfwbqbwbbfXaYeyaMgDK84AqbFC7UXbIX4hbGQnriTKzMG1KCzGRojuIvHWHFtwoUO1kEAJBRR3CDw11MGEs5d3QeP1llIKjqnZLbhFGdgx3B8WYyRCIArRmOZSBWnCjemp6DYUGJCeFahW9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6MAGmwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7qijG/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6MAGmwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7qijG/G"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R1d86x1280783
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=; b=C6MAGmwOfdVa2x9A
	maezeYrZhsF9SpMTWajUBPo+2s3f7fQpCsYx77CY/WPaMwziB1n5xB5W8bYvNFfA
	+GBV9wCPfEe/BRpt+feGZJpDdKataviwMaXkYod25/cL+y6uAbaPbv2JLqknjMtM
	WrucOL+nJU0s9UYzCqeLBVO6JoMiXuObY63Tm5UnEwyGCHEIAC2x1OyZbLEkcD0P
	6QUcpeY7UNwfkRenxn2xlaoNymEGWMe9jaW4b5bB6U+Kqe9F61ec4sLwNz+OaDAE
	Bw8kf3NdOEFN1KxIfpMqYhHLmxEh3z+s8TobhFbIxy1/z32i1zTyyR9IaWKpdiUB
	eMFEqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp39m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:05:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d86d40acso55182701cf.3
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790514353; x=1791119153; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=;
        b=i7qijG/GRx+JdSnathtL6JjPD/wklVAkSHPDKiK4/u/NEAH87XP5j/dzrrinTiCrYj
         21fnecsGk3Uo94VyT9Wbqu8ExUQzO7GhviH90nth17jTZip6abjuW462GHUTT4LQiq8h
         iLxKpVpra7h/5yJ8Pb+/B+BpsjRp7daso/boZrlmrVw9FgUGXIdnp7/saP2dGqF3uGAn
         bP6j9c1hDevbJfbxH0svj+9eI0+SNbb6AlPiCPtFwB1hV9MHbs0YZnjvUCFoP6h67CbS
         6zemu2OUXEW26WWqW/Wtbk0YvW2G6po+Ogh5pKu18hC5CRtDZgQocLJjPUxbuuodUMtE
         0IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790514353; x=1791119153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BkXSWtx80akFwCoBF0CHDjIQOF+Xh2PE8+5HXZlOT+Q=;
        b=eTcG08M62aTDP0DtWNTbE/jTiB/znRzueNHlfu57OfQvp7ZUcbqIFjLN+cZZKLHrGn
         ndhSScbIlQCteoET9qHNMf7F9fxoK8ZRWbDBs7xjROVNSHTu2PUmOqOKI3G8n+unbgPn
         M/D/xP9AhYETi5+9Oqsi7B2AhHUWRYBGJEbmp57sl6DJ9vJpqM+3+NY7OinglKh3yWEy
         i45PZddnZJkuDx+bgl6MTJQdD1GZkp29XQanPobhs/L44mzuCZ2iE7TD4yorPxfpRD2U
         NWKFQENUjwws18j5cGWgnqm3ce2QhttdftOrPDY9tCzecxHTtdyoV6hf2QmpuvXTp6rU
         9a6A==
X-Forwarded-Encrypted: i=1; AKwUvBwc4cx5YEscper/OtJ0HiT4W7ouR6UkCx1GSxmSJj7WnXG2vIyHEIW4GTtCgBG3RgFaEhE=@lists.linux.dev
X-Gm-Message-State: AFuF++mazNtqqnuTOQpn3j4kAxk5dgse41vekCw0orjkyZzolbdwzGQj
	pak9hfz3Wvp8uQL7xmUo9h2WcLEiR6EVoOS11K1gCBTOaOdutL/anviNFyg6mHwNiN3VRiO2XJ0
	wA7+fpEMXLX0tg9KtDgdtsDu0uq9Av4BaWsS42b7glgU9h54TeYGzDxY=
X-Gm-Gg: AYBFou23HdZC8Muw4+DpNU36yo7R3/6eKpzBRiriPmtSjbzgJww3C1FGvI2bMr+y3vP
	p3QEjj4xelFb5GJ4LyeJ4Lx0fxjv6C+ubgD8sA02sfgxCmLKM8LKWIdQnUQNbHsD7PXzzbhRwtm
	Hizo5TzU8ojbPipNQ3cYXt8FLZiYyd5ZvDfgMUznRCxmH7Dm4cOj34s9N5ZEK04i+ZfsRRfuPNV
	e1ptkQdh/4sKE7hwCAX8l9NKVZE+WYWtsuPfgazcuios0AqLZjoBGQu9+gtw13bPmPa0fx8QRCy
	Y/rTUXcxFpGsdlO+iPb7mbzyz87ZjoZ0va53f7U2Fl+rx2wC3aj582RHyllmwVp1CZGfod5hzP3
	Rr96FATxD8lb9L1X/1yCSZLTrD+kVwV2tmUOwn9JblEdM6rjnH7aAath8hk2rFXohCTyViaFAy5
	7Gzb4uHEXw++ZD
X-Received: by 2002:a05:622a:580a:b0:532:d3c2:165c with SMTP id d75a77b69052e-5330dbe7682mr144377841cf.5.1790514353358;
        Sun, 27 Sep 2026 06:05:53 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:532:d3c2:165c with SMTP id d75a77b69052e-5330dbe7682mr144376751cf.5.1790514352651;
        Sun, 27 Sep 2026 06:05:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580c66sm20204111fa.6.2026.09.27.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:05:50 -0700 (PDT)
Date: Sun, 27 Sep 2026 16:05:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MiBTYWx0ZWRfXxI6JDF06UJbi
 ZQkRVIhF2dVgtAyd40eRUwq/3uxJKZlOMpga4rHEDLKGYq5rHpHlKZIAzj/pU0zlK7k6smBFkLU
 ceg+SOSHkHnRm1Ynmr5vKiMcnYJ7vChYteaLCJ6waOVHVPGyOD4FPRrHLcc5Pk/B0DmVjCOO4gT
 0dVpGAp2AcQ8No3aQqy29C560enmD7ljqoyI1HRNIaqoQjHxQrKnhFSWYH7mHcq+fCEMw4DkY1e
 RCxEPr1qProNZRRnXtHZdvIRfJrUJTX4kRsbo1PYhtoKGoQj16D60PXjUCKoHdKlrj6taiVGl3x
 vN7RrmvcNWrSBysLNPxsGgteXrB4iYldfyA6W1kE/rW1xX5zmib6Urw2wRXmDnraHljBV4XDEzZ
 PL1ZadjgKZnrrJgXIkXrikPwfkB9jveYP9PclQtxywF7gvI9W5FEbplI5VxPgeAJnMRzNZ6pcJi
 +mc2aokl5vv5pVCjALA==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab914b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=MMZBmsOjQwISAzkKN4QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: YYZ1oXkqjeBhsjQuiInYJet2eW7Qoqc0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MiBTYWx0ZWRfX9t8+iO4x501P
 axHaojJyPFP/qRC6IOBDWhKkf9f8xNGUAVTn8lYcFbUzc+u1j85//OceBNkxoDfuEcyBZYgvE8W
 bywrB/EZnZ8X5wEhWZvl8csOcSN4c6k=
X-Proofpoint-ORIG-GUID: YYZ1oXkqjeBhsjQuiInYJet2eW7Qoqc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270052

On Sat, Sep 26, 2026 at 02:40:19PM +0200, David Heidelberg via B4 Relay wrote:
> This series adds basic USB Type-C support for 1st gen devices, covering
> configurations that do not require VBUS power (e.g. devices using
> externally powered docks).
> 
> VBUS support will be added in a follow-up series after this one is merged.
> Supporting VBUS will likely require refactoring parts of the SMBX charger
> support, which is why it is not included here.
> 
> Tested with an externally powered dock station:
> 
>  - Pixel 3 / 3 XL
>  - SHIFT 6mq
>  - OnePlus 6
> 
> Tested with an additional, not-yet-included VBUS patch for non-powered
> devices:
> 
>  - Xiaomi Redmi Note 7
>  - Xiaomi Mi Pad 4

THis is very interesting, as it will also unblock DisplayPort support on
devices from those generations.


One major comment. As we see, on SMB2 PMICs parts of the Type-C
functionality are provided by the charger / FG device. I guess that on
SMB5 PMICs we will get the same problem once somebody tries to implement
additional charger features. Would it make sense to rework the PMIC TCPM
driver to be a composite driver, taking several components via the
existing Linux interface?

> 
> Credits to everyone who has contributed to Type-C enablement before:
> 
>  Casey Connolly
>  Zachary Dry — LLM generation and testing
>  Max Furman — LLM generation and testing
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

-- 
With best wishes
Dmitry
