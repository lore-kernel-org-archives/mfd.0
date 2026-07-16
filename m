Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD0C3C0625
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188732; cv=none; b=L7Zq1Sb1r7LAgg1/I2mqguCzyqze0gT64RekT4uzzggza/7gljy0mH+FCE5CqXJuiBX0hpTl9XMaMgFVJb42hLppCpbJZkCzhuXRWwAs8ycefEM+ED4Ye52xC9jrNAScEulSWP6RCryi9ocktXc6aHkdM0D8w+k8WFOTnRIZrcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188732; c=relaxed/simple;
	bh=x7f6ykCk/miAUHqMVubQoMrHsrPAo7l0UksaILbihmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lCcoTw/hmg75BZTcTaB0li8Fz8qibnlo+a9LeRlBZ7MkiYmwd5pANcLl2jWtw1UhiJh9N+9l8VPfEPD20zW9Cqqcx8keezD9JRgUs/Ma8icv9pAFVLn52VjunjlZi1/YYSYTLslhqqjuEVKK5F5msDBXPEm3ZnOesPif0sRpNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9qZ/WCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9Q9+A22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9qZ/WCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9Q9+A22"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DsN62048853
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 07:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCWZw4mQZN4disJevi7AP9Kq8qDcEdIma1/3n6QXqfI=; b=I9qZ/WConx/jwu6q
	wlqaSRhZaxdPO4fbt4jHSL9ut9kMHTGkpcxuVuW9YTVMFVm+utftJ4NAmXAYMmgf
	jhINJMadDzpbI2c9Um2izzpZSWvgfbjlZZ0pYUDNbAB6oxn/o3cBcdFdRFV98nWL
	e+kiE80Vjzb8w3uUqm6n/CvolmKDU7IqofhcQTNdDNxlQsvPyHOpquTPh8Uw4x/h
	atUALkY6uFwLjn94D61wCDMmNia1aOxBNgZRHZpkLo/AvojoUxHSujJ8MmTXkhva
	lDJsrcRMtRXnQRLgNfO66wuhAdJ9Pq1hav+F5D5bb3k7OTirrfyHrrPTDP78Sszw
	cc2qJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfkv8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 07:58:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1ada6c43so97170521cf.3
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784188729; x=1784793529; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCWZw4mQZN4disJevi7AP9Kq8qDcEdIma1/3n6QXqfI=;
        b=Z9Q9+A22/CjRjVbV5JhNi1giI+F9UVv4/n3dICLQBD+u+NE/Jrb4B9RJzURrRxiMyI
         2LrMCVO/iTzCbjmAv06jo51LvaIE1AxKg0StA7VUc9n9pesV1PkUrxZ+SvwW1PWCAl22
         qxh1c8fOExveW3KBSrY0mURVdT6iWi3umJh9tWo0Lhdp6bRjp1Jznd3C8r+w0OhiwNXH
         58vIH0XlrIJRGN3WLpuWfMjaHr7+P0KoJ/uRNyugMNxNlGs1mwuCzPA5eQ1a0PqcrSCl
         jWm297vZSYE/W0Vl3jEcWw2Ddma8fQRlFtAb2Rj+enELKXHmDwLtf32UQkvhO9qOG63s
         Q9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784188729; x=1784793529;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCWZw4mQZN4disJevi7AP9Kq8qDcEdIma1/3n6QXqfI=;
        b=J2+gV1kxC063hNbQY9lN38tQq+cZyyePYvX5UO0Z8oSiThqPe4ArVbzhBlPD5rIxi9
         2H8iJraob6wpVz4K3Y+W6OrDX1KlSOpzBe5rVswVqvoNZm7dA8AQIeYwnQFtri/ioo9p
         9AwNVGRj9Hw/oOqueWLlVUqe8YVBnvcAEC6joiaJmVGbwxR1otlNObJBSdqXIlCjfNYI
         ctosa35gAO1b19rlIdz5LhpbQVRjoPfu8NNoKf3htsWxSRX9CQrsxXy6pKTx8zpnMRYe
         04NT9aszXJmvyZ3cm3+jFCtEqyPbPAXXgF4Reha2X8HXEoNcJdURrAZxarg0i7mVOCVx
         akCw==
X-Forwarded-Encrypted: i=1; AHgh+RqORlgX1dRhMr3BaSPVInQsI9+y0KJ8hR1GhnngJhdUGraRL7qcy4YO7zmc70ND6vxddmc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzafT0u8RSXMxg63MK/IfzenlnnJ9iohWV7T8oQk+C1dj/B5WH7
	0u316hGz2vSNTt9m1PQ5qn742igjbJpMXgjr+tFr5F6RLqrO6EWdncxFWa+/e3jX7XRLHFqN4Js
	7ajD6AfC/CvG1rlDyPJ4Hl/1d53mMWAMHbaLLHO9FaT/FGeNmmeMoiTE=
X-Gm-Gg: AfdE7clUVgHSGkqDNaQotjNLxr/apzYrsAIpg7WPFwup2ovy18BXf9Mq7GuWjoKN636
	yillB2fggEue7czgtPJT/0nVsvaX/TpTAqMgJ5Ll0dH3vqosaorSGXXQnOnqrqyWvY4YDTAsyiN
	IqO9fCiQhU0kcPeLGSBj5DLS2wxNEYdMeAt7cf3XwpNxkkwwKqQ3Ww9zdD5+ZBJWYIw1EjzxNwl
	3OVonl386K0LnUEX/LvJ2mJt5IPBTqZYvk7Tfea5shi94Wk7cXvkT5lomyaSWBw6/UHo3BB2fFU
	i7N9L4cCCk1rGUxTV3xjNU7vl+V4tGjZ0aAE7ohEBxf7mIgNSaiEwE3LKSeS9piDiC99Yls6Met
	jZOTPSPm5AYjKC6SdKHrsAr0ilg==
X-Received: by 2002:ac8:7c49:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-51e4edde1cfmr64748441cf.16.1784188728983;
        Thu, 16 Jul 2026 00:58:48 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-51e4edde1cfmr64748321cf.16.1784188728621;
        Thu, 16 Jul 2026 00:58:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a63esm22876616f8f.9.2026.07.16.00.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:58:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
        mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Date: Thu, 16 Jul 2026 09:58:42 +0200
Message-ID: <178418869936.4524.15759697748852640442.b4-ty@oss.qualcomm.com>
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
X-Proofpoint-GUID: wXVy1Wu4bcsvLglpMBWBg6qW5VZijYXY
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a588f39 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eBqHV7G4w-rDf1fxsOIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4MSBTYWx0ZWRfX95iPXOhVe/7S
 OQ722PRGnsOg5qc++3VexIf8/Nto12+WKTmhfm4+B2oHqr1Uu1J8iA2y+aqkQ1YQ0kwjd/IS2Nr
 i6kztumSCOmUJl/2VgJK6N4TbK3gJ691UBc3OHZii6ZYvWnw2LvNTxZsLNgXxt+xHQ9zu0DDpyf
 zYiCNYe6M71ETqWBZn1WVelVG1Lz0CcFoiCP88j259BNeiNLisu/rSNGLOYquxZbzdQwir9rudr
 XcZ4MgADO2YR04ND5WmBLrmDy6W5uuE3JUQ3LHOYzxJA/cg0qjKJg29Diy3TVonvpRDHR5TYwVV
 Ow3JffzNaizWER4X8Ye1RPgJrfzqDkfGa5Y/uA5Qtd+cpoivLVtgbOgM8qC7/iNuKr6GctEViuB
 ZIQRrc9Jp46LgKv6ntAe8wfAmP1U1mmzBR20FNIKjSihNONhvP9/rKrWcg7vhWYkSwBWMwme7Vm
 yTTDpiNgovr2Fp0uXIQ==
X-Proofpoint-ORIG-GUID: wXVy1Wu4bcsvLglpMBWBg6qW5VZijYXY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4MSBTYWx0ZWRfX7uWQXurhXncw
 NuP4xRGs7Hkf+koR7mk7mNE9OuJRi4nu0+jnm0gQsnxZOXZiWYoQizGxc2YMaIR0axtBStXXYDy
 e70uX6mCePkHL2B1I9XM68JpRo1Zuy4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160081


On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
> No more users.
> 
> 

Yes please! Thank you!

[1/1] gpio: legacy: Kill gpio_set_value_cansleep()
      https://git.kernel.org/brgl/c/aa4bc3b7d36d52caf7c3d3214ae4ce96d609e8c5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
