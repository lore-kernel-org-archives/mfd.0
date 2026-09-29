Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93989526A80
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687961; cv=none; b=RRdJrNdzRxuGeIrDi+jCniuoDcHE4DfwrdgHI6vAnbSQ/UO1/9UbRCEZtCvxCNteXYvTKAu1EV2HfSMimsan9rZTuojmQW7AW62w1M7hqJUn8VMQqJcob6alR9whakV6/H9FYm/MfdDHaFjLQW07wYhpi7JZ1sTQ7gAJlO5+JrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687961; c=relaxed/simple;
	bh=32Y3KM5bCP1SDuaXQ/j9zM68Tajy2ksHRzCJwpZJBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT6+e9Ke6cHC3gKF3BGw5+kCtLo6f/xgD2mJI83vT+yS0zUeVAD9emw48lxz2SNQcVGG+THJ4i2pUxSgr7VuEHgcI/5AQ6PqqXDpLNOdT+RIpmCYfctIW0Vuzz90m7wUjlIycODr+bU98Q3EHrFiXJq3VdVms5AzZZ63ltEjHtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpPaViXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkX7LWsF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpPaViXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkX7LWsF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiu81016994
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T5RkWVrZxsjtjTmZsWjGyBA
	n0522HCwfBHwVcNib0U=; b=OpPaViXGEgW04crH61xZymXkMSy7UodlkTejfqOm
	D2DzzS236z4RZxyjZFD1yY97g6+NJG1C8spSIZ0HJY7sV2ocFiV93DZ00h2LtiYy
	LdPkTiHRtxfOw+Hd7IoGzaubLuysCacMnVVfNYXLwdC3qzMYWHLkEEehl4dtlX7A
	8XbDLbeNunYLH4zqIhVr1xcS8FELJIlsGw/I0O1uJCh56w1690DTUou3yzi8RW5a
	NJXKdRqUhQoVOLkTvthQ39Kxmq02GxLoJej4c5Y25XnMojQ2qnY0WvpabbtUVVaf
	ZPxGWmRFiVqor8BwMAPrx24ah1KCu+/xZM4rR6k21CjLeA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxj5g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:19:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b3cd4ce08fso497069137.2
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687957; x=1791292757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=HkX7LWsF6heFwtZIiN3gr/Sz/YXUhpIKa9l/RGsL0ZuOMN3xF8e7w+o39EdvkhwQRk
         ISo1vlqh0n5x+hCSNfK5/iQUYYHSrkLhx8XVThZj5XiQ/9jgSxnljPBa5EsLYYQ8tMss
         OYxuoeg9GXjdgepjpBR2kgodcrNjsmGIWXVacyJhB9hG+5+TZS/eyUVbHn4PoHn3D4ap
         ZZ/kWJsIThRHU0+qRIBAnMPppqDj0t94B+Dvv5/8lvnnd0lOB2rZbCY+wynxn3ItivBB
         LfgKm3I5uLYHD5djaRrq5iU+GFy53glOq80x+++xyiSb5WvGmFFbuk/ly+XJlgrPkm4M
         h9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687957; x=1791292757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=2NqE3xbVck/39zGIJwSegIIuUJRl0kqW8wtZwR+j7FvHwMjwh2WhwfltNnClGEZeeo
         6JAXGQf2PdSAb627u5oBBWbEovDpn9hup2Siev8l8XRWMRyHRPFZlksaSziJrMqJREay
         Fky6v/vpoww4sHMmLCSQydzpMTypD4RLUHPpssSSYebVi7rNRaId6MExItJwHXOgZ+S7
         8ADrIDh6Yfa368Aqtwo8rlb9GEYHpAldFlbk89QaRdl1aGZxW4QuZxXwH/W0MEhgD/50
         3gTbsLSMK7hHLebiVUjZ+is9C9iTnHLYxswVtYtXwux1IeQOwCEZXiBay2cszX79pVbY
         E28g==
X-Forwarded-Encrypted: i=1; AKwUvBw43ELO3558XZf2ApQ4bjM8HnRzMv4Vfned2B269vCZTZfqqcTb1cx9PeaxwxoECRBbDy4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKQ/0NsusBOAvQhXmuznek6YmfYNESq74Gnat+Q+XnVBKI5P+d7
	Gj3nDDlw0Ie6Hcqg+h8KQf+f/rj7ihAT7tf59JR8jwj2ovQVt9D6cb/qKR+ZpRsssBtxgeyKXV0
	dlahegsIl7NTHkYpZ1JXTyAJyZPIbv3QKPIuJVGXtMgibeLGi0oOnlyM=
X-Gm-Gg: AYBFou3Q+H2A2VGlpvHh+G+7kBz2Z+RJXO/ByoNi9Mw4ee7LXe+708+sSI87A0dLg1D
	1schLNJMw98q2Xcl5MhV2Ok78QDKpQ+MdgVDYxf6mzXQJZkOrscFneRqS3/jxa225f1Yj0Casc4
	QmRhUUeolfoLxQ/OnCB0wKyM/ft4152Kp01YoJkUb03jwqlYfmncOfEi3m3mzbX+zlvK58YLigX
	N9P76MooZVeLGOO5s0+2g1eEcXtUM53kbmrk2EcsfwF0DAqSoOLgO7YwOPJJ9Zi3yCy+UBVnGac
	gdOQJtI80hlRm+ywDIZfKrP7j3Avu8+KZa/svxtETNg8Ino7oJNRqhJoVOIFUVdJVaWbKE5CZMs
	MM1kTwASJDsro4Zw=
X-Received: by 2002:a05:6102:5714:b0:7b2:9b08:7e24 with SMTP id ada2fe7eead31-7b29b088957mr2999237137.34.1790687956460;
        Tue, 29 Sep 2026 06:19:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5714:b0:7b2:9b08:7e24 with SMTP id ada2fe7eead31-7b29b088957mr2999222137.34.1790687955697;
        Tue, 29 Sep 2026 06:19:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d00570sm3501885e9.3.2026.09.29.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:19:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:19:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Message-ID: <3ic47ak3t6zeac77r7tq2oeovmy26mh6kieyssinv7nm2dmzzj@33zfyfxga56g>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX/5w+e0Qub8Ea
 ObxZTBRNg9Bf9XuGA6T8U2zFgnQm/wCF4egsVSxZ8LyfgTpYy5fJzYz+W+RPcMZF84rsTj87r4j
 2/t9MpD/9srAtT85g+6+dMK3zdCiAYk=
X-Proofpoint-GUID: ABMKyRTdXShFuObZ_E1pZhzyzX0lzHF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX9xurlFwjxzzf
 0F4vabMNx2cgO+5el0nuxHxrZX8A3xm3XSczAfRoqe46ZfF6l3N7n6WwWQr/6aW/ZNZuiQZZovQ
 6OmbW7EE764mvpt4BaaRAD/zJn5VcGRi/QnPFJR5qc2I3bUbeENEecwVIsI9zjbIN6kC6I6r8WM
 Yyj7dwlf7OcL6lKYOCqVGYSFngWR+6f+UiyQytxw3gWn5DWwCVMFxqqAZC+NVfcppTNJgY+wCiJ
 bBpobKcyM8b0/pd1IYz+cNEXgJO8W8pgCaBkNS4CV7lJEUdtPVqO1uvh2ReV7mxfm/tH1tDhEQa
 8Xq6jjlfFq26bCv5IxWnQQgj1tTkEAronZLvOyb1ii7WFFAYYHCh4BH5qXESEkMHAU/KI5wMLZI
 pTVb0F1vH0UdfNcnQA/BKuPOJHFXIrP8x6aCX4prOiMx9Z/nxXFjfiYEJcwwKeSMKa8f2Wee+kk
 ebuQtOH7SI3Oml09rHQ==
X-Proofpoint-ORIG-GUID: ABMKyRTdXShFuObZ_E1pZhzyzX0lzHF3
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbbad5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:40, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
