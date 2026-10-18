Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8053E2770
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 23:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367593; cv=none; b=LOv3uilhzJXYec4oVtkEBzfsLkbMaazau5JFt4NXOkyw+kbTK66QzLaZK/WdkZY+dKjOXNxPVGt2FDG4Du4RRIF0oz4QAWsXQvnfliwkb/VhWKpAvSTQ/Jfw0KaPx3CGsRNxMZcroxWTThYEehYyN1ESzid9NNQAPlGzu4WmqWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367593; c=relaxed/simple;
	bh=6g5HKqFJHy+jPg5eI51EkhtmHAefO2ruYtPIveQKssg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNFqk1JPLQ52i+EELIVzJ3LeeobepCkWUG6dK2anKum60YkxbFiHn27TO05xcZsAx9jB31HVwUT1KpJAQ4WQEUDro8zQabBAmK42njPV0NFwlbJC6I2/NUgYxhXrFqQSnmMzlX4lc4qPL+5gL0bBPcS4yD6nXT634BcViM1tNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvdU+p5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4sT+W+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvdU+p5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4sT+W+4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ILjddi1312464
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 23:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p0UcZjLCI5EsaKXVYEifEeVT
	wnpPCrWb11gsbObd+YU=; b=VvdU+p5P2HVWGIS4IDl2/9rNdQMdmpu70XGjiIUY
	9xHLxWOawWeirSqftTIKVKv6NbgJHmQWMi+0W/CKA+JzhkyWi+g3cy9Sm5yCSIhG
	huY/BmDcqjOHV3qZPkCUoZWYK0ReofsIbivraCWuYwvXCwyCIFqO4Keu2tMwn6BC
	dZeYzOA5OrY51NjeI7U5h/3mByROVrnmAb5SQDm+Lc4K32xxKsBJDRTLlMuk0K14
	ivOLMc3VJYrLyTB5WhtjfhJ9p+dVs4BH62+U0afgjCtekfWdeTuLWZ/L7WBvFiKs
	xq7Kd/M/HhlIuUPFznC0Wd0+k4ZjG6xh0s78LQm1nego9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1g81k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 23:53:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso394913485a.0
        for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 16:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792367590; x=1792972390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0UcZjLCI5EsaKXVYEifEeVTwnpPCrWb11gsbObd+YU=;
        b=E4sT+W+40BN/Jy1IYUvL+GoMr0oaIiA25XjBwyRRwXi+TVFBARogkV0ySS5qRs6t1Y
         yIbwCT9JkiPphirw2qB1X6Co9e/vhqdwiAcanq3CiBXrnUFWydDSra8fjG/li8oBgSCL
         Zne7tbn9iBt8b4Ne41M9LyXFGmcMjDRHP+tnhhusd2MPqH0AWIPBI/tT+ZuNqEHMh9iZ
         rT8hB+QcJBb1IfqIaE+rx+Gwtq/uRYrWWXJO5kIcBJBXeYK9IM48Jj+jMHtyDvw+kuVb
         385U40u8lHqigKUweSw3T1OKHXd5wppPW4T9cVlSnhY6ZQbtex5uaQZ4X3CuFEkaluUK
         ljDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367590; x=1792972390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0UcZjLCI5EsaKXVYEifEeVTwnpPCrWb11gsbObd+YU=;
        b=yTdpVKCMO02DaEOAlrICLt1/ul4gP0h16u6ilzIaJTPXgrH+SUUhj2/U8HN7iad6Nt
         GyHXIbHJwXKMAlejZl2dY1wrw48tiUTZaFgyRi9kOoDIfgpXUe0qFpVcGgCYMQ2Hc3Kj
         SnIlsX55dO6P+To5b4NAFi1PRUqt+w9pDImZyoo8vf4w1Xd8MX35XIRwlxYdwTWxohBQ
         /8t0DtRUD7/X/U5+t4/Tu9c7kk1+HV4OUCk5kZrJ6ZWG06wHFWpRrIvgwvY5sRvhS9uj
         ZQiw7A/X1X9TKSqJGAgGillMvDVOKfjID13WqjQqDRaVv5dbidO51QWGjgymVYgmWvpP
         wN1A==
X-Forwarded-Encrypted: i=1; AKwUvBzzJMZ//v7lfw5L/MxpNV8fBFEABO0G8xNUGC3pyMra7QijrYvDc8uTTxwOeifmSxePNFA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKLCtH+9OMXwD6cvPJHj80BCYugqdcAxzsjx2aZOcG1RMoCzJ8g
	8yYM1igWRB+xyoljv5/t/PkoZgrA7K50LzlpfAgySZ+ByoDqwGkaVLquyCU6Ugx05kP5FxfokVU
	k1khMc/eEKnKR+XqLNfgmb2sQ/HqFixYrEMIqiSC81atoRknGQCVRPl4=
X-Gm-Gg: AYBFou1r7erGDrxxY9jha6KgmDB0nfj3hzeR+DsVWCH8fENeYXXjPvKrh5FpUzDO762
	lgSZJfj9dte2SLOUZZfAg/Aqii0/TN5SOOT3rh2HGz4phpPG0XjGrLMb6xe/z/Vgv3nw9K18FR1
	DL+7oGJWOtIhKbyoN3gEgfLpCXFDV1BOr8Kc02SBrT6N7px6siRXuoYb5KFH8HowUlTSapDEGOg
	HuFebC5nyc8mCKQB5Aknpu2Dq319yirwKACYe9pLXEUQIvBz8hEilTFepLURn+bHSlacFd7k6Dx
	/1aD9I5JpnV7m4wsQB119p7cVGaxLU8pMh9tc3WyJVWyXnZqzGAvm+JxYaP7NnxW1OiCs1zXzga
	YpWl76Ma1FBLvtf22X8NZjOSpSaTc1DygsiSrmv2/tC/Ji4v4eala2yy9l+xa0KRuCxAOalawez
	BUPKBgZ1iDsuxM
X-Received: by 2002:a05:620a:a181:20b0:93f:2479:2b4 with SMTP id af79cd13be357-93f247904fbmr734309185a.10.1792367590068;
        Sun, 18 Oct 2026 16:53:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a181:20b0:93f:2479:2b4 with SMTP id af79cd13be357-93f247904fbmr734306785a.10.1792367589543;
        Sun, 18 Oct 2026 16:53:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm1616881e87.14.2026.10.18.16.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:53:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 02:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: David Heidelberg <david@ixit.cz>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>,
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
Message-ID: <eodzuccugtdn42basgpczett4yatyirog4nxwe5rhg5xf46ibp@jzcjmje4aqc3>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
 <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
X-Proofpoint-ORIG-GUID: r4RSpLNvoQRpv5p4EvoaiIwGgqMplxOc
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad55be6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=3RZNE-nbyhM6VGf7PbYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA5NSBTYWx0ZWRfX6beAhm9CBZ7c
 +DNbCzosrjQvil244CR3OzYiTFIzWomANkdDmE8DM49kk6zCtczGXl1vM1dOL8ChehTGDbtK/yY
 UQhudsS+TJs43BPhcObWTLWwuHoGLeo=
X-Proofpoint-GUID: r4RSpLNvoQRpv5p4EvoaiIwGgqMplxOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA5NSBTYWx0ZWRfXyC44c37VJe/+
 fxvve7bZJa5pRCuVRGe+KWcQCX2Xd4X3EUxYKhRhGGgrojTc/JHuJ+k7UMh5IX8w9ePEt2ilepP
 6gg534r/Yy0LE6qvWFNPNkX1nq8YsVjojW0Ql9USUa1CYY9OGqXxog37WN9FEJpYkx7Of+uGctm
 OKWTPLLo+si2vHouuodf52YLJTuJPcsoAANn0WR5IXOi2AefdlwI27OC6hTLAvEdadJnWBV1Ib5
 WwlD6G/iDFXwVeE+F9KvJgWFYHA6BqMfK1KryrDe1eFAn1aEZy4IYAZnBjbNPTmTY2Xd9g+q+bA
 OYB9ZihmaXdIR74ZvvLypRL8+xZ9eTj0SM/2jC/zx7v0W0bs1IGr0J72DpDqGMcnkZl8K+fuEQT
 A2nJawG2Xs34H/cK3IOJj5l8A0T1s28m9LGjwTPEB7Ns6Rpm7v6tMsqt+YB961iRpvA/onLvIR0
 LLmDQEWDQV2SWo9VGMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180095

On Mon, Sep 28, 2026 at 04:54:08PM +0100, Bryan O'Donoghue wrote:
> On 27/09/2026 17:33, Dmitry Baryshkov wrote:
> > > > One major comment. As we see, on SMB2 PMICs parts of the Type-C
> > > > functionality are provided by the charger / FG device. I guess that on
> > > > SMB5 PMICs we will get the same problem once somebody tries to implement
> > > > additional charger features. Would it make sense to rework the PMIC TCPM
> > > > driver to be a composite driver, taking several components via the
> > > > existing Linux interface?
> > > As this gets decided from the QCOM side, I'm fine with whatever suits the
> > > hardware best.
> > Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> > components be fine?
> 
> I mean maybe. Would it not make more sense to land the TCPM functionality
> and then look into adding charging moving then ?
> 
> i.e. finish off adding this piece first

The problem is that we already have SMB2 charger, which accesses the
same region. In theory it is possible to say that USB-C driver conflicts
with the charger "for now". In practice, I think, it might be better to
sort that out from the beginning. You didn't have this issue when
working on PM8150B support since we never needed charger for that PMIC
series.

But, then it's up to you and David.

-- 
With best wishes
Dmitry
