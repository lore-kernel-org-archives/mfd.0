Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108EE4E1414
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057503; cv=none; b=h8SxyOr0irH6XvXlDO5LxdDOOlvF9upSMRU3FnOm1R7oA4juI3epXuK5Us20diT3UKpOuUU2bXdLWvhZv9D1E7cpNaANhbtQpCie7iY3pOHBmj8J6fcTCkXtlKCLXQi8YYMxrNml8rN6kWE3meLEaDE+k/BDjwq0VtyZlit+Qu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057503; c=relaxed/simple;
	bh=qtRguwZ4mlDCaVkmB0miTkMjt/Pa0fU+Vx0oFLYuu7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCWRJY1B9oodqzlXJ7uZ6Rz2n1PhUhoUlonRgQtdmmU0OYuLsB2Q2YYuVqDpEZ2GVLvf2nByBn/wXMkp3po6PRRgBCzl8tfRSnoywUAI01pZBFOSvJsIM3i/eO6wcytvnbRhK2J7ax+MneeYOgdRc6bsULpTMA1DAGPAY+KG7Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMpA6lx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JG9YPCXE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMpA6lx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JG9YPCXE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9IChN1640151
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h+FgW93lIZWkl4JuJ0zk+Xr8
	VIgEcu5OQYc43p0CbhE=; b=gMpA6lx+13WJeyGV6JAdEeHHZRlhyfCnTSgbygGy
	E7mWXkhSxHSeaC5OS6wjiSmN2WJcUNy0Whi9dRNs92KmXQyuvpNFFlnBaK74ToLu
	6mZfMZ1scobI7uOLGI0hOkrJKxUGFUyMyGlbZk3B5lSwPr537MDbPxJAZjZah18y
	xYv8QJWXuIUZZaAnaDid8GGVoVERbXGF2e2iD2lukpEmJwleqBS6Sp0Vm1kEgS+G
	BSdxXIzlM6NWRLuJKfmTDCA2nAYCBXuMeALqVw2bMVcrbP30drh8WYqOoiLW37k8
	3eueEP/a0HH4PW1Ohmekrd4Wm3+4k9RRgQiX8BjeYGHY5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhe45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:45:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so379742785a.1
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057500; x=1792662300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h+FgW93lIZWkl4JuJ0zk+Xr8VIgEcu5OQYc43p0CbhE=;
        b=JG9YPCXE4CQ1I9AwL32FOCNxsgppQXLBrneDm56LpPWd8YOrrByWqK6IcIbxEbH0Ak
         cGB/fkGDqQUhn/zKZjev7lvqxGUCHHtXTT1frpqlo7rn+E0JEcGHyLSdueimX3WQruHn
         0glJKZfXYX/sPFKzkcxe8rAtCOT+PJ3MPoz+E6ORdb0QElJg7rvtaTD5/Kj70Zy6yVvK
         qNTGE0Gf34NnHKJgeG0A8VG8R0aVVeWyFvrvDyLw4RkSfP9hHs3OU6fS2woTmlaRYTRS
         E/cA8dIUk41eFAox1BigdmjLLDfbrg/Hil+MsRn1DXCeP9FQBV8PUU/CjkPWVKhb/CKQ
         wAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057500; x=1792662300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+FgW93lIZWkl4JuJ0zk+Xr8VIgEcu5OQYc43p0CbhE=;
        b=xaO2YrjlW1+QP5oV5nqZbXB1124AVo0PLobwf4i3w1lDaJKtMBWvfTCnaJlhOi3Kez
         VsmbDUY2TZxz3Xmk4xWt44bTtmbbzP8ga/lMVFr2DfExknTL7p8zTM9VtqSbdZZrtdYM
         mkA+/yFhyaVtzhtMc3Dwk4OvcmofcEJMiCZHphzrf2A7WwORqnbst0KoNDjPCndAq1X/
         e7+CXNpoX3fx5IuohFG8vWoJfdY+V9TMjGBq0hx6YH6baqmyqIe1xcKeb7fHw4Tq5sW6
         DYnBCX/QKPsyxEr3ZNCNc5J0GvGvTjo82BbbuK9n9czOwDzGCFFQGjP9ih/UAVUa0nC4
         bvyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbiGj12aEQXJyNvvY+h2PMIMLkt0UrEv0QsoZsgxQhNGpeWWsuyihtUlXODo+JdDaraJs=@lists.linux.dev
X-Gm-Message-State: AFq9FYJfhUqQQ+ylQoknjU9TzfxM3pT/jbLAwXbugNQCbPMY227vKyJF
	8AAEvSIVkp1fsP9gZFMfPAZfK1o9Ueci/WIES11Rhl/pycI2EqREv+aa+mj9N3do6xVMhL1e/et
	rUrcaIndDR3aWAsb9C/A3CiYVO0yUJQNFlSXK6M+FOHQOHDeAm9DU8v8=
X-Gm-Gg: AYBFou1xUyWp+F9WtvN7gvL6YgxUd9sHu6t5L/oiyah6YCqavW+SPXsj2KaqKEWPNu4
	iugoYlWl2F/e/6ewIB3ciJzmNZNZ95J8rIY6R4y+cmfsTQaICijoSXbVCaeUp6fX/jsnbF8GdkA
	2697LKpaV0D0HGNkjuoY1HHstp9InZEz4Xsj7+jwo9PAm1phjvk6EsF+MxSXcovxIPm7nFtbgMn
	3oPf+05FIB4726hbhv+5zUFacy4QMVjb2JEhOj7vKNbWuxv/81RBJYANArXFul0s64X30UXIl9N
	gPHuQ2y3RA4b5xisbfBh4svhhAqqKJqat/jcg2GpcCmjHjxfsJOsF0vuHZBcIDgAYxlKpvRqhbv
	lATXV7Tk4gG3JPcakBX6Aal2qfNGlpUXgHMyzKQuNISSlYZsbF6AjEtKgdps9xc+uvANJPvQ09J
	+w7k5UFmNHHLDY
X-Received: by 2002:a05:620a:4613:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93eb95e3828mr2851431485a.7.1792057500175;
        Thu, 15 Oct 2026 02:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93eb95e3828mr2851429185a.7.1792057499630;
        Thu, 15 Oct 2026 02:44:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab1169d43fsm796131fa.23.2026.10.15.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:44:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:44:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
Message-ID: <6x7y43ldn6kjxowm562icamjaajnxlgarzbelqg4wkgvf5vbbo@x4t3mu6f44wr>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
 <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfXw46ZRjq25aaM
 bvW7b8cbv8W/UZm/tknZuPJs5Tsjr21WEL5MU9ZQL1PJHRne2p+tfCeXh/JW2Rsvup/EXrcPnfa
 qvb9kAm9x6mb8l8PstbB86gH5yAt5ePtITVxFAdRJPi2OAPHzUUUxLrhfGFkhg4gWoXWUehP+Rr
 tuoksi/oz1kjwPC8ybcUl4/UCl+wt6bxGgs3ig5jrYwDwTj2Z5aPq76HTcrICch+3HaUII8iJtV
 9uyily/sCD6yemCcjOLci632zOT1eiCCKhqG32OyRUGh6Iw7CWvvR04k7YYJk6XQj4zVsG4sd4N
 5qXk1ydvXQaig57kPbuHLtNqz3f/GjQfZL2TSy9ihzox6pVHwIFdovvGfsBVNoaBLrkcTDtqh8k
 +qHDIQJGITteBEkEMGo2TJMmw1+V9Cgt3gwurulxO3wBfECSAZc5TeGrwtWS1FEKso29OaNO4xL
 pOsibba7TRExKLXaGyA==
X-Proofpoint-GUID: QnKvtq_Otk6UlcoooI9IEdO2N8janLpL
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0a09d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DzZZqAc8IDjE5QScHtAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX0M4bqUkGGPJ/
 Gh8X+9VSOGAfKIouQh1pDGN/fbNd99nsGDbGtGgc04BvnSlh8V3a4/l5wV5flFjSE0nwYw7CZco
 eqYPp5GhwPvvJomNyAxQo3t4cxdVlYU=
X-Proofpoint-ORIG-GUID: QnKvtq_Otk6UlcoooI9IEdO2N8janLpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On Thu, Oct 15, 2026 at 11:11:58AM +0200, Konrad Dybcio wrote:
> On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> > If the bootloader leaves the WLED module enabled, the OVP interrupt is
> > left enabled at probe time. The first brightness update then schedules
> > wled_ovp_work(), which enables the interrupt for a second time and
> > triggers the "Unbalanced enable for IRQ" warning.
> > 
> > Track whether the driver has disabled the interrupt and only enable it
> > back in that case.
> > 
> > Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> This was merged yesterday:
> 
> https://lore.kernel.org/lkml/20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz/

Nice!

-- 
With best wishes
Dmitry
