Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF543CEC0;
	Wed,  8 Jul 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513188; cv=fail; b=N/cpOswBkmcXTGT9OObWttqKxNZnXzZ1JD+K+sPZMXZ5WZkubCKc4il1b1LW4egAWbutxsFB6Fuo5/uw4JS07dcG2aWHhB4T/LnSU551qd5m917j0rIR/uJ6MCqj2t5cZZOtCV5gMwTJrLpLATgGc/mTT4811YvV97LgHWQMb7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513188; c=relaxed/simple;
	bh=1+n9pGVBWt0wNWf2JRIJch7Aw5gf6m98a09VubYtV4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkO+v8/G5mnTYLeyNwPi49B5LPSqQSs9c7Ik3QViZpdjsUXJKBMg6XwYDJ736xug7NxYPo5LGZ7WIEn7eEA7zLGK1d0AM2wPLboiA6BLmrALvXZ3YNp7wMgG6V5SKLyPg7II/DZC4+by/D+6hnjKDYHy2XEyXWdJad39z2dvAas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=En+7n4Vx; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=B/Mn9tL8 reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="En+7n4Vx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="B/Mn9tL8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6683v2pE1543079;
	Wed, 8 Jul 2026 07:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ykVw2DnDInUbMsYmje5kPtlhXOiSWGzvZlrlMkhiASs=; b=
	En+7n4Vx686OBL9kgG+cwqhDEMoDeJoUVyH5PGpVs70cM/hPbdWwewF1cgcHbqu+
	bTNH38xRNfuqwvclumXcazO2syQesmCcvoB4j3MQDP4nCYuealx2a3IIKUpC8whS
	YB3JcZZNpTth0hVMFi+GuAq0ofnbOoTqqsa/f39QdGjMJI2txqM+NoObPfpuGMnw
	D/eeqsnOWZaBntjxbMZu7ql0mMKJt3L+uD8G4yo5AJfwfRLk68OGk7QvoGn88QeI
	QSdTHN9Ri5XAbOKwFEnlEJu02IG4RUr1vWdjiD1dN9pEyeEnpw84FJfX3dX1k3vO
	n2ZXn0zJugJ9ZqJak5aXGg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021107.outbound.protection.outlook.com [40.93.194.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjp7e3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:19:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klTxaNurdLDX6zw0r0O475NEJfhaeL3AV1aafKYbnQ8F4phk+kx9FgaSZOhAXDR5o/Qohh5bXCVRT3TCaSXH+76jaAOQCq8fkTiiMxneCBkx9b3vsJPGHNZax587g7GAQFHcGI9+j3oEMPmifFw5Iz0u6G8qJyz6iZdGUUNYt1frNpbf9Ob+pzHWBoRGqgslox68QF85PEoH12CW+7rQwONhyO2d69i8pGzgqJfdHvrMGMrimuNtzzbwiQZuTgaMfWIxAf05By5bD7qCzx/Geuw0aQoG+8zn42SgUWOK+3QfL1HaCZZjwaQ0YSzyQZW8zEjeSFFM2IwwDutr0dY1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoyE6KmjwsvttnR2jgf7qBdcYUSdCqfZGaDB39mIz4E=;
 b=M0k+pxPJSZjXcquZfwEq4ihxNuFzWI7tLNlnmrpWGHCM1fpr34g7BYbXSb3pvVE8Wp2zTVXjSASa7IsfzSfzB6msF11Tp4oebGyU8asrqM9rvG0Ag0lsJvt3q/Ezd4MpryM+ucDbmFNGC3i/4zm8qA5Yd0RVsXaTY8A7LQr4n+MVZhZdKYSK0IhV+mEVp98i2KFJNfQRM1zp1TrauZtlhOz01H5SBx3NMv91jHoZltwdK9vJ9KjVT55UfZG1YialS5ynygGQe5qPQ5XXsrleBzg3OEcvlaHmN8i0OqZIykt++LdTzyc3Z9pH/kUJhoppwAUyTqlv0bpzdCEPQC11bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoyE6KmjwsvttnR2jgf7qBdcYUSdCqfZGaDB39mIz4E=;
 b=B/Mn9tL8WGO8m0YgM9Gr03kvSGDstGiyclsDlE+/43PvRFCddv2LEuvw8u8po9gq0FdpuFxuy11IiFH3KUx3ab2UYCvKiSMwTtp+HRu172ZoDTEmm/RFoXIZuet46W8LUM/3jK4+ZbBqKAXgdAVahZYGK6DlP8ntjyCpnwg/6eo=
Received: from DS7PR03CA0076.namprd03.prod.outlook.com (2603:10b6:5:3bb::21)
 by LV2PR19MB997213.namprd19.prod.outlook.com (2603:10b6:408:37d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 12:19:34 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3bb:cafe::70) by DS7PR03CA0076.outlook.office365.com
 (2603:10b6:5:3bb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend
 Transport; Wed, 8 Jul 2026 12:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:19:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A65FA406541;
	Wed,  8 Jul 2026 12:19:31 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 955DF82025A;
	Wed,  8 Jul 2026 12:19:31 +0000 (UTC)
Date: Wed, 8 Jul 2026 13:19:30 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 23/23] mfd: Unify style of spi_device_id arrays
Message-ID: <ak5AUpoYGz50Td6B@opensource.cirrus.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <13f1c0ae1697c6e3a342250e25fabdbf1499d642.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13f1c0ae1697c6e3a342250e25fabdbf1499d642.1783507945.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|LV2PR19MB997213:EE_
X-MS-Office365-Filtering-Correlation-Id: 50633ba1-0fa3-4b2b-b3e0-08dedceb2af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|61400799027|82310400026|18002099003|22082099003|16102099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ewsj5UGXmB3mCcjiDf7PoqCW+l+YMTFeeWIisDhpfBNl3p0wPr0zJIlNza2pka9RuOy2vu7GxAsyn+BYwneUMg2LSbgNUZfFSFQBLiULbos/bYinRh5Ld5VyaKJ4EqiHehHxCVbxv5KnkHrk+WHzJnitBmM+qxLxYpm/84+o1DnxmC69CillnNp8YlPnUBAhW0bgwiGuJaqcUNDLT9eEuw6sAUqMRhDl7H8t2nMtPgEgEbWsArsXthCzbFkhl9ja6BhGnGgfIsoW0I10mYdcJ28JPxWMxEBPYE2L1uEWYDWMsSOWvYYuOEHshyfP5prapIHy/JfF81+D+L3ZGtDmRTCjfVAg/FueO0LWAZ0sZo6J4ez8q+niL923E71h3TmpFx2f6b9IEEDLwITTV1krlzg+Facb8bgCevDEHS445zQu/2ghx4UeEjgS202myolgTbw7JMhiW496Q/ixntsYG8vLWBIXWQPHliWN3kVYMg16xxxIWgRDD/98qgnjp0Fw0mHYl6FXgRmg7VVYjWIlYcbVHKsOY7g4uIsibWaavBCzIF/wdRFuJ3qBcSHhV4zL2MGlh+6XARJ/ZXnts0t0PvdTR/cBRoSkFbHhNnKhN6w4QLpzVFqVC5qC+rvNlOi3IPC64u180WV9E7nPfZ/WXmxPWKaYk071D5OaoKgpb5bEE/s8DocNfRoLBmWNoQh+9yu0o0Gp0DVIkTz+nRBi1Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(61400799027)(82310400026)(18002099003)(22082099003)(16102099003)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lFsfyM0hpKtXS3roscnCawDzw0xZMPKBivjyQ4iJ4gOAMHs6FQkRgBvvntkP5zMsfhlPWJq65e5+HNlTJDmjRcEGlCYns0U/+1Hr9MshCZYjCwFU8NAuynQ6NBOjmaQhKdTAH1EY9+ewJ8zJIDJV0bXhqU3F+amT5+OLIJLemX4jeSZxduhpawLBddqlKa9uhSRhbmjyR6RKFn+rkShuwa/xnGjvNMMwB3dsE5PiWfUW3XJOihMGiU7TuYaMhnT5iENO01RucNyx2bhH0UZ8mEavkJHRQnsOtM7G24x/ZYFWZyE4bzzGTU2u6YtYOIc4Kq4PN4g0AgLEKNxlEhzsd/6UQYSWOBd5ItFa232zlkuxGo0MukG9hkn4DPWaCPhYu2Ud+1MoRJrBel9ayKwi76FsOLl3MKeSjK53qCT0Hd9Vc1fSaleDSNq99XlTGFLU
X-Exchange-RoutingPolicyChecked:
	SGEg1ENx6QULnbJSsn1JY4jdCR7kFSqh9Ey7m3meXjojBrftVIY3pmLIoPqOJpV1yV95nueXLGigL7CQ9rJT2Imsredbge41StXdWtbclsHnLlx1idrvnh/D4INz9l3Plh8N2KMJUOOo35oyMhmzidJg/vVRQ5wr4YCbsl4hyZ5mwsuiProwqnrRvM5bVy7SAGa8fX/aQNfs5Olu9tJl6EsLt7ZJXs8jaRR9LimCrnOyU8uNtXzmhFQnLiVIqBhJeLi7fNYvQTtyouw1mMjVYGg3CYQ1n1gNh1TjmacYk8ivhexeApnEfcwan0MuKQkNHUDtf4ibsj/H1P+g5tm7sw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:19:32.6557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50633ba1-0fa3-4b2b-b3e0-08dedceb2af2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB997213
X-Proofpoint-ORIG-GUID: Ui0Zcs7QpMonywVM_xYkMw8AxyKw_6HU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX4UcBO7uv8Nmk
 JlbH2As9ozGf23K2sxY2iiiTIm7fLYmJs5d8tfzQ1WHej5ncqz+165o1UJYCBDT9jxeoJnQOPd/
 sNcXBdmeggcS8jRn9sUL4LvOcg/qzWs=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e4059 cx=c_pps
 a=xmT5btM1tXsMPZo7WXzprQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=F4wxPZVc1jiR1BN_hbcA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX1L3ja1D4cMqd
 q3sYObd2lnWLCixflWIr2KCQCgm/wFh8i54gs0TIK4kQwwLFlMFMmM1FP2G78vwYv4Ou7zxBF1W
 qKzWpjHxs1M3ttLetQPcpaoOhwLpmmmxLBbBztiLMSgf1CZF3QqeTJ8MFepLp8OnE8ulDFNDbYX
 Us+6pSTutJEiMkLNqyhvAX1z8hQSaGxiqrRipn7CcXVHi/uzrESggn4Lx4ld14kT+Jxq59H8ZNp
 8N/Z9E4O3GPPrIwn59HwL4jlSl8gy1sSUAFtMHdfQlwkchlKe1GJKJSQexsyr4uxlOsKB12wrPH
 7p6ElZ7TirJQIYoz24cpxeMFTBZls5raCPF6lpbtEp8tvIHDGdtvS4bxRBWCcR9PKBOD5izvGp7
 rE0IqBGjjLCxa6PuuTepgZEL4zCL14REcCxLT5Fx912UcWIeDW8ljlcGfv0N8AnOo5fYFZ//au3
 P8zJlJJBGz7BYHMlK3Q==
X-Proofpoint-GUID: Ui0Zcs7QpMonywVM_xYkMw8AxyKw_6HU
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 08, 2026 at 01:15:30PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/mfd/arizona-spi.c     | 2 +-
>  drivers/mfd/cs40l50-spi.c     | 2 +-
>  drivers/mfd/wm831x-spi.c      | 2 +-

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
