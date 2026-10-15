Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5451CF76
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065938; cv=none; b=BlK/SeUgxvqVh9JBvjtLhdp0mYJNPkCnVC9+ig4U4ozhE7hix5V3wyKtAklxsgo/AuhXW6g+fIBBtHn0bmpKpckS73ZccttmQNHg62OIv8KH3IvzpbSF5M1YD529nc5wkoAKpVTMuvg7aM2epWbFzk9Ept6rExctIH6DBShTakM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065938; c=relaxed/simple;
	bh=M/RFP3tW6J/fH2HQRESbe9xsyMg57bApE1n6BVIlfeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCqKdKIi7/N9tiUvicCWTOx4mlJCxd+J+pwaVoiW4WJNszEQ/la+aMK/6nI65kBAC3VEzqsePky2CkbI/YPq81CzEr1mS5LldBp6tC1CuI8LDNByI2imF0DHu00Dm/vLBcrkfp0OZ5lygmlTFmfndGRWfFQwsdABmOlramr9QpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mv+FzTc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDUFaIdg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mv+FzTc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDUFaIdg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jT6q2809328
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=; b=Mv+FzTc9WBRENdJj
	CIJFc7nngedIb3QAP+juJRAhYYpa8IcUUXvv6KxJU121fyt9/VRdRyvxgNyAw7AA
	Pr7ajw7YEDcEZ6DDBRZvSitsvLGa/L27aI9yNLk2vsvhEOsxwLmdFYlUsriFupxD
	PgKr1kQ8NnUrUbSQ7JLv5HluUsCuX0JqGeVpnouK5FytYjKNLOZjBG6rpcLJqzf9
	I2KcBCtFlzaHzF5hZD9pQhbocrBHOX/EPU+ConMpljdRqLp/Z/krmb6W4bXw+tdu
	d7a8pVPaG1K+Ktbp6WoV+uHRt/pKEsa2SGzE2b1U2e0Ybu8DPr5Xmi1/kPi1t/Pa
	2gnuDg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tewd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:05:33 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b530df14so51050241.3
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065933; x=1792670733; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=;
        b=IDUFaIdgpoZYee3No/OYwjF9OtiFH9fpHSJezqNkPUZKpieRXLzpKA7r/wf7WIzluk
         IaWALdo3Rf5maIL/YuUv1cr/6QlhPpSWA9WMdBz8vh15bjCwUUN3GsGQ17f4KKUEzkk2
         9Zw7oz0Zivddl0z2o8DU2zd1KOHrYoPhUNY0nsIGjTNSq1O6gfPnRsdVdASs3KGt3/Bb
         TtcfHDrwAI98QYJHKqCvGAvf1gqNlTk/5RdermjgIXzrY4w9+GEHV4bckGrpTVGSK5cY
         oX9p/8dTVZPoV7fAb6OB77ZLpDf4BwWFgyLFy1am6UTPgqVvJVCXYl7iKGl6hsUGxv/U
         i2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065933; x=1792670733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=;
        b=P2REPuibXMLcBesGFDfrQLFhKSya2uXqMruIIEliAuwysayAgWLAnSQVCa2DCcA7Ol
         R0f74xXx4T6IRb/4P0gWm8dI17ghyrfdJuD9GsTQzOAZuWYrqNEVkBNOeu9UKXI85DH8
         rmh31Om4j4eCMWSAQY+ho7neesmKr528dL04AI1r3/XfoX+SrDXIpsrDpuyEEjEptqwp
         f6E4bXQUtOFduC/tjbUWtYa7e8jLWOHGW2Yw34uPLVPAbAlb5iGz7EvPug3OOiYpreMG
         jMlVlQZmewWQ8QHx/0wuq3WnJto0Cktke2/qS17yZ6aKTTgDm+zek9YmaXb+5EohaXsW
         ZZAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhHfEKyPjxmwCH+aw83lREMvE6za50vMVzODqWT5S5RpZIDi0TcgAXMku87dYrW65baO8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIEyPR7O9pmDjeUyoMupg5Va3UMnQFgGcO6wyBcAJsqqHg5Jwsx
	oEn2EPrrj4f1Y+tVWVQB++/pWmB3W4dd8wleo5wvnr2bOYG5Sh2mFHzkBamnxzcQz1JItcSQQbJ
	BAg7gI/2/sSmtMmQNGHVkrec6OfoECFjnd18aC0uXAnT7WCK+jWniSgs=
X-Gm-Gg: AYBFou09unzbbm8xg0mOMTzgeggUFeBaTpi6/I902k7/Gs5+CyD0wQJuyS+nPM74WwY
	2IQe0i6nwQKG+JsUkHY5LUkxsf1Sov92+vlQ35sS95IdEqJZI8kM/apJyIyi5NvjwQm5OKXGnVT
	6bXGfi5v/Q2RmliPWSQGOdzl3G+l8FijnZeoGgzTbhrDnSuVPcTfvmZ9nU69VlOHMJiIUX0UHFy
	qWXff+wuhirC/CTwHBJ9q21Df6bQMCx+wVKjcdYGi5NkPN6fn38J37XOOEpASWfKP54TEDsLDCb
	lG79L9i0o1AKmqAzFV/KaiI1rVfeM3QbtC8sRu9NOFGjsNXwJgRAvSI1T/QazxLEK3y3E+N4cvx
	72mRuy631NcTVeGnYqW2cHg==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3998242e0c.0.1792065932649;
        Thu, 15 Oct 2026 05:05:32 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3998226e0c.0.1792065932228;
        Thu, 15 Oct 2026 05:05:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839ca1sm2510539a12.11.2026.10.15.05.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:05:30 -0700 (PDT)
Message-ID: <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:05:26 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0c18d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5QhvE01mUc9NbrqAj7EA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXzhIhHzYkr+fG
 WKh4gfCZDQeYjC6y7FzmCCd6xbrRnoJZwmnAjohUNXYvRMeJwuLp9UdtjuITLebWExkvaM97pBV
 LteV9MdHBAsaMOP4QfbUN98pPprLby8WPwIyPE+41C96FlkQk7+p0jbG1KtY58w0OwjrYvrn39s
 4pBGRDc9iAntB9lnTPm32yi/+iEpOoYPE7+/qoEo6Dz9pbXClJBXrgAPrLSVwihdQ0XKulPlT8j
 UmcvdcZcnXBNnUYls5hhum42EgdtJWUmNItrb0DZUnYtyev0m6LaS/2DjQtopYITGlygmHzqzIn
 SG0AbfuL+ag4P4y1xtRwtUB0wszFRJml46UJkWZ6uyFIBphuWmrvVmLS2ug6ygXTOxNS19GngBG
 bCvUGVQ3dr95mMPFqB5DS8cOCxBHP+hbNr+4XjJsMSsXbhkYjfUqdc8OwKsO45Vf1VIFy3LJw2k
 XFIiSilF4nPry0Tv0og==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXx4MNCDtOKAqc
 TpWTCg8SCLNo9kVMrI6nBfG4CVVXyu292BEtOPzbMYwIOVs2b2OpN9NQPuJ/EbRnlkGqOPmC2fp
 KQeGMj8N6vloOa1r+vU8AlFIw49Qunc=
X-Proofpoint-GUID: jiiqZgjYwt8PxeoBY3XJsuwTZHXuMd-c
X-Proofpoint-ORIG-GUID: jiiqZgjYwt8PxeoBY3XJsuwTZHXuMd-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is often wired up with the interrupt pin tied to ground. Only
> register the IRQ infrastructure if we have a parent irq.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 4179427f3891..8b1bbb4052a7 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
>  	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
>  };
>  
> +static const struct mfd_cell pm8008_no_irq_cells[] = {
> +	MFD_CELL_NAME("pm8008-regulator"),

There's no reason to not register the temperature alarm driver
if we don't have an irq. It will not be able to carry out the
"alarm" part, but one can still poll on it.

Konrad
