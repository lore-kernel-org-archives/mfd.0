Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F84518154
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898628; cv=none; b=PhomKhw+e2vNkwTLTT1kEcgOTtjGtVueTUpVK7HeYySlH69cgpm7GdIfKOZzfTN5rQRJcMC2mfrrHyOKWrIxIAhzrceC3/LaqF4XKzGIBGY3NJCwX0qQTuUBuB4M+SuDizrc2nW9otfnbZOqOlPqzcqpavh/erDX4OlbJKbLny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898628; c=relaxed/simple;
	bh=64WuHEmxdRWNJkYPp5WOn0H21zhMZRGRnFl3heqDVqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FtLlggZ6I6uNME6czjmO7DbdFaraR3BUz1QaiGUx0mtKYBWqpUb1ZcLl6m+ZwsfNbJOFRc7TCoUZxXSzO4USsdNYCBzrxpISnwK64UfA+PtIqSGMOq/5uqgV5IbZFVfuRn5TwCBxSocPPVjN8FEUb0y7H+pbNpL1Q8Vk86TPciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7wEF220; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1DvmADr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7wEF220";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1DvmADr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8V0Ww922844
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 13:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=; b=i7wEF220NTpnp6Xs
	mnFRt/VjEHRo/jlOJTzWNsVZAC/kiglCevbxfT47GrrTMkydr1jCylzXO55IwF9A
	7GUI7b+WWXS707qu7gchZ0foZ37CQdSCdurTKUF8Qqgi0nWt0HsmvWP9xbcGmHz1
	8/Dz9Fm+a3NfcR0YcRLxlqrj4T92u+TDqIXU1tLWSBddUkUTVTBtbJJYfifbiROR
	uWHV+DIzBNRZYibblKRHtMCWZwFwLDLXdeTjJZej3kkZBl7lr2E/S9o6ExF8RsW8
	myHvITXP3aB2/zp/q0EqNe8ZpazIZOGeBk3szjv7tyvypXUIsV21krmuNM1ge+mh
	/SttDQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1u6qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 13:37:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf71bbf197so2477988137.2
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791898626; x=1792503426; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=;
        b=E1DvmADrUxfeaDJm0UTsEt8spaur5/7i5pSWpzrg8e0ZYBzVDERpm2XjPjsXN1m7Bz
         Y6ZoR1PihLhAv3T3zpyXbRXGd96Gc3FFvIzeujYtoGk2Fq1Ha91BE0RWLd8q61wNhJTa
         d61P/Mziy0EVenrr9jGUN6HefNwqkd2MwdcAtEDJXE6BRR98ROMStaQX3ezDbxi15pYO
         xJQaqNumqfG/qLTzfmYmBAElmjgQw6/tkFshB5J5CWlD4LoUS5ppNyxNAcBA9zyGhXGu
         l8PsNIsRBrkm4qkjHCZgI6QmhtwqSaWxEO3yBwD5JrGoRhV9QwpTK/hlv0v+MiZkLYxL
         TL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898626; x=1792503426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=;
        b=KSDb95B0xP9dY5xUfwslUCZqza8MKUd34n4d2UCb42brwDEyeElulz7bWUT6HsvZKJ
         Jrw2ficyrkeXcvzNi/WB2tAcGmRIeVN/atEwd+RvI1uaD2TEI/QTjHgfX9mSN3nH+Yj9
         ZAsWzXMjVks89IwaF3TCS0tF6IHOaULbhrhCsV5VcFuj5gQyuKluq/TjGRzT411hAlF3
         qF7LFYaH9u4hhDvFm+XoqGai35m88cGgW55kCrnELoxhnoVVR8tucgOIXeAfWIx5x8sE
         yNMoipq0p4WntEJZOFVWzMMgH4biSyXdnTFbrbw2b1yenBODxlR9H+SJnIWudm5pYtgG
         LylA==
X-Forwarded-Encrypted: i=1; AKwUvBx0/wwyLFUsbjxDSQSorOMMysEjxE1/SWR8oG1AUgIbprUpKQ95WW/gpI1sX83roqrOcLE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLRunJEefN1qIBmkAWR3YaB8l0kFB4PKOOEOwFbfbQLBrHarHkE
	3Lp8yxSRRhZqjTzW2grJrKisRNBXoAGhmomqanICnFGKvmBKJsgOHQXvtJDNaJzMjR0hYrhMvMq
	eMgNzprlTOwhYdzzJnfLMyAeobSAZxkXV44wt/SFfsDtHhUH7H4bPp+s=
X-Gm-Gg: AYBFou19NijbNw/A34uqocA/OKjY0dUKJi2J/VD6adc5Hk1DzL9tbwo0VUdTISssGFQ
	CzxnkzeFGuv35Gz0RcZjlbuhNHK3lvT4YEu3IeWfesaiBcFxPKuL9r51K9Y8Ecpzp3WvSxtnuFc
	vfAUYtbOk4BkfWM7AwZwfVLSurQLSv1af5mD0YrBSu6G39LthXq4i1ggm/Ab8qSE2+UiJDfllKN
	PmeYRo0RBkxVIC/L/ejrl4J9J9j5GDf/VvZVtjNDkbk6euk4NMBmzYdGcCaB1ExFdpaPvl48FUI
	qWioPPck/ifz5pbph/kC+WJmgryPOxXSu13zpzZ7+z2NbhPldDmEzF66YAhCmaVBfOft1ZD6Zot
	bFHNmzbgsC4ON/QBUwFHWM826zX0=
X-Received: by 2002:a05:6102:2926:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7cb3729bd82mr4019569137.7.1791898625885;
        Tue, 13 Oct 2026 06:37:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7cb3729bd82mr4019550137.7.1791898623915;
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ae0c9fadsm66312755e9.4.2026.10.13.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
        mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Date: Tue, 13 Oct 2026 15:36:59 +0200
Message-ID: <179189861230.27409.6716341566208896281.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace3403 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gkddGGStw1GqfmxTrhIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: H5YpE_DFmegLRgNGkc9O7mLiHflgpsIb
X-Proofpoint-ORIG-GUID: H5YpE_DFmegLRgNGkc9O7mLiHflgpsIb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfX90rzzxvtcPDG
 eS9WVUp+TOS8V1wM+MNf3xsP+YYTZUJ5M04rJM/BNL4w2WZdoUg2/tg64w9flomOaUth40d61iC
 j7g4WoIdFbUS3Wjbk7IOLS6ogoZ97os=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfXzKkdLdlNtsTk
 umer2m78PY3tg5zu4TaK7k2KbHlfH5JQZqX5w8A2RKzbckpm4/SqB6/ZzbtJesu9dYi4XDosy0s
 0tJg5vlayTgyu7OnsxStHiGJLmGVWoGK7nxRKREQ9vJu5N/XgzoX6OsMVScj4Mvey2XZRgUEizr
 BK0INocPSBbGs56hBuz1ZLNjqSVQ6ytpzCNXfxCkbLsX5tkol+ClNRE+vFbZy2AzhCfJFs2eckt
 Sv7GBKn/ACtn2csgtpS5Z7shYXWwAre9GSoP6C1PgWIm8+4m1mw93ARXccNyBgB12nbgdDhjfoS
 l0WnPpG2TOGBZ7TcvJMVVYCt/1o0dRDiRBxJ0OFoetAAVO9TR+5pFgze4FeH0RCuCN5VHKfqezC
 a/vNl0FPIiJ57ZTZN3TQRix8A6tP2wHWeTWugNcVuK/gUunC0GulkZ2gXJQLNjFJmsxbdvhqDxo
 yCqzXJU1jNZZ8XECbLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130054


On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
> No more users.
> 
> 

Applied, thanks!

[1/1] gpio: legacy: Kill gpio_set_value_cansleep()
      https://git.kernel.org/brgl/c/93f4db6fcf0bf62a4e00c9beb571b35e6e3860de

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
